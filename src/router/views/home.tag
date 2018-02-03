<home>
  <div class="row">
    <div class="seven columns">
      <h1 class="logo">Tasks</h1>
      <todo-list tasks={ this.tasks }></todo-list>
    </div>
    <div class="five columns">
      <h1 class="logo">Create_Task</h1>
      <create-todo><create-todo>
    </div>
  </div>
  <script>
    this.tasks = this.$todo.tasks
    this.on('update', function() {
      this.tasks = this.$todo.tasks
    })
  </script>
</home>
