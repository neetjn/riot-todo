<todo-list>
  <h1>{this.foo}</h1>

  <ul class="unstyled">
    <li each={ tasks }>
      <todo-task id={'task-' + id} class={ disabled: !enabled } onclick={ parent.toggle }>
        <h4>
          <input type="checkbox" checked={ enabled }>
          {title} - <small>{content}</small>
        </h4>
        <span>
          <i class="ico ico-left fi-calendar"></i> { format(created, 'date', 'yyyy-mm-dd').toString() }
        </span>
        <br />
        <span>
          <i class="ico ico-left fi-torso-business"></i> { assignee || 'anonymous' }
        </span>
      </todo-task>
  </ul>

  <button class="is-danger" onclick={ deleteSelected }>Delete Selected</button>

  <script>
    this.tasks = this.$todo.tasks

    toggle(e) {
      e.item.enabled = !e.item.enabled
    }

    deleteSelected() {
      const self = this

      self.tasks.filter((task) => {
        return !task.enabled
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
            clearInterval(fade)
          }
        }, 100)
      })
    }
  </script>
</todo-list>
