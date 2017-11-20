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
      </todo-task>
  </ul>

  <button class="is-danger">Delete Selected</button>

  <script>
    this.tasks = this.$todo.tasks

    toggle(e) {
      e.item.enabled = !e.item.enabled
    }
  </script>
</todo-list>
