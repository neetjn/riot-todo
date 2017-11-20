<todo-list>
  <h1>{this.foo}</h1>

  <ul class="unstyled">
    <li each={ tasks }>
      <todo-task class={ disabled: !enabled } onclick={ parent.toggle }>
        <h4>
          <input type="checkbox" checked={ enabled }>
          {title} - <small>{content}</small>
        </h4>
        <span>
          <i class="ico ico-left fi-calendar"></i> { format(created, 'date', 'yyyy-mm-dd').toString() }
        </span>
        <br />
        <span>
          <i class="ico ico-left fi-torso-business"></i> { assignee }
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

      let disabled = self.tasks.filter((task) => {
        return !task.enabled
      })
      disabled.forEach((task) => {
        self.$todo.deleteTask(task.id)
      })
    }
  </script>
</todo-list>
