<todo-list>
  <ul class="unstyled">
    <li each={this.$todo.tasks}>
      <todo-task>
        <h4>
          <input type="checkbox" checked={enabled}>
          {title} - <small>{content}</small>
        </h4>
        <span>{format(created, 'date', 'yyyy-mm-dd')}</span>
      </todo-task>
  </ul>
</todo-list>
