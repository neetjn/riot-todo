<todo-list>
  <ul>
    <li each={this.$todo.tasks}>
      <h3>{title}</h3>
    </li>
  </ul>

  <script>
    console.log(this.$todo.tasks)
  </script>
</todo-list>
