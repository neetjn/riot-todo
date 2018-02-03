<todo-list>
  <virtual if={ tasks.length }>
    <ul class="unstyled">
      <li each={ tasks }
          class="animated fadeIn"
          data-is="animore"
          unmount={{ duration: 1000, opacity: '0' }}>
        <todo-task id={'task-' + id}
                   class={ disabled: completed }
                   onclick={ parent.toggle }>
          <h4>
            <input type="checkbox" checked={ completed } />
            {title} - <small>{content}</small>
          </h4>
          <span>
            <i class="ico ico-left fi-calendar"></i> { format(created, 'date', 'yyyy-mm-dd | h:MM TT').toString() }
          </span>
          <br />
          <span r-sref={ '/profile/' + encodeURI(assignee) } id="assignee">
            <i class="ico ico-left fi-torso-business"></i> { assignee || 'anonymous' }
          </span>
        </todo-task>
      </li>
    </ul>

    <button id="deleteTasks"
            class={ is-danger: hasCompletedTasks(), is-disabled: !hasCompletedTasks(), u-pull-left: true }
            disabled={ !hasCompletedTasks() }
            onclick={ deleteCompleted }
            if={ tasks.length }>
        <i class="ico ico-left fi-trash"></i> Delete Completed
    </button>
  </virtual>

  <alert class="is-warning animated fadeIn" if={ !tasks.length }>
    <h5 class="text-center">
      <i class="ico ico-left fi-alert"></i> No Tasks Found
    </h5>
  </alert>

  <script>
    this.tasks = this.opts.tasks

    toggle(e) {
      this.$todo.editTask(e.item, {
        completed: !e.item.completed
      })
    }

    hasCompletedTasks() {
      return this.tasks.find(task => task.completed) ? true : false
    }

    deleteCompleted() {
      const self = this
      this.$todo.deleteTasks(this.tasks.filter(task => task.completed))
    }
  </script>
</todo-list>
