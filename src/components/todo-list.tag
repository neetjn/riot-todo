<todo-list>
  <virtual if={ tasks.length }>
    <ul class="unstyled">
      <li ref="tasks" each={ task in tasks }>
        <todo-task id={'task-' + task.id}
                   class={ disabled: task.completed }
                   click={ parent.toggle }>
          <h4>
            <input type="checkbox" checked={ task.completed } />
            {task.title} - <small>{task.content}</small>
          </h4>
          <span>
            <i class="ico ico-left fi-calendar"></i>
            { task.created }
          </span>
          <br />
          <a href={ route(['profile', task.assignee]) } id="assignee">
            <i class="ico ico-left fi-torso-business"></i>
            { task.assignee || 'anonymous' }
          </a>
        </todo-task>
      </li>
    </ul>

    <button id="deleteTasks"
            class={ is-danger: hasCompletedTasks(), is-disabled: !hasCompletedTasks(), u-pull-left: true }
            disabled={ !hasCompletedTasks() }
            onclick={ deleteCompleted }>
        <i class="ico ico-left fi-trash"></i> Delete Completed
    </button>
  </virtual>

  <alert class="is-warning animated fadeIn" if={ !tasks.length }>
    <h5 class="text-center">
      <i class="ico ico-left fi-alert"></i> No Tasks Found
    </h5>
  </alert>

  <script>
    import panime from '@exah/promise-animejs'

    const self = this
    self.tasks = self.$todo.tasks

    self.on('update', function() {
      self.tasks = self.$todo.tasks
    })

    // # make sure update is invoked within tag context
    self.on('tasks-updated', self.update)
    self.$todo.on('add', function() {
      self.trigger('tasks-updated')
    })

    hasCompletedTasks() {
      return self.tasks.find(task => task.completed) ? true : false
    }

    toggle(e) {
      if (e.target.id != 'assignee')
        self.$todo.editTask(e.item.task.id, {
          completed: !e.item.task.completed
        })
    }

    deleteCompleted(e) {
      e.preventUpdate = true

      const tasks = self.tasks
        .filter(task => task.completed)
        .map(task => {
          return {
            id: task.id,
            node: Array.isArray(self.refs.tasks) ?
              self.refs.tasks.find(t => t._tag.task.id == task.id) : self.refs.tasks
          }
        })

      const animations = tasks.map(task => {
        return panime({
          targets: task.node,
          opacity: 0,
          duration: 500,
          easing: 'linear'
        })
      })

      Promise.all(animations)
        .then(() => self.$todo.one('delete', self.update))
        .then(() => self.$todo.deleteTasks(tasks.map(task => task.id)))
    }
  </script>
</todo-list>
