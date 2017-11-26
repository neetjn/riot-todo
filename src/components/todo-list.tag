<todo-list>
  <ul class="unstyled" if={ tasks.length }>
    <li each={ tasks } class="animated fadeIn">
      <todo-task id={'task-' + id} class={ disabled: completed } onclick={ parent.toggle }>
        <h4>
          <input type="checkbox" checked={ completed }>
          {title} - <small>{content}</small>
        </h4>
        <span>
          <i class="ico ico-left fi-calendar"></i> { format(created, 'date', 'yyyy-mm-dd | h:MM TT').toString() }
        </span>
        <br />
        <span r-sref={ '/profile/' + assignee } id="assignee">
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

  <alert class="is-warning animated fadeIn" if={ !tasks.length }>
    <h5 class="text-center">
      <i class="ico ico-left fi-alert"></i> No Tasks Found
    </h5>
  </alert>

  <script>
    this.tasks = this.$todo.tasks

    toggle(e) {
      if (e.target.id != 'assignee')
        e.item.completed = !e.item.completed
    }

    hasCompletedTasks() {
      return this.tasks.find(task => task.completed) ? true : false
    }

    deleteCompleted() {
      const self = this

      self.tasks.filter((task) => {
        return task.completed
      }).forEach((task) => {
        var taskEl = document.querySelector(`#task-${task.id}`)
        var opacity = parseFloat(getComputedStyle(taskEl).opacity)
        var fade = setInterval(() => {
          if (opacity > 0) {
            opacity -= 0.10
            taskEl.setAttribute('style', `opacity: ${ opacity }`)
          }
          else {
            self.$todo.deleteTask(task.id)
            self.update()
            try { taskEl.parentElement.removeChild(taskEl) }
            catch(Exception) {}
            clearInterval(fade)
          }
        }, 100)
      })
    }
  </script>
</todo-list>
