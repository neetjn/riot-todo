<todo-list>
  <h1>{this.foo}</h1>

  <ul class="unstyled">
    <li each={ tasks }>
      <todo-task class={ disabled: !enabled }>
        <h4>
          <input type="checkbox" checked={ enabled } onclick={ parent.toggle }>
          {title} - <small>{content}</small>
        </h4>
        <span>{ format(created, 'date', 'yyyy-mm-dd').toString() }</span>
      </todo-task>
  </ul>

  <script>
    this.tasks = this.$todo.tasks

    toggle(e) {
      e.item.enabled = !e.item.enabled
    }

    console.log(this)
  </script>
</todo-list>
