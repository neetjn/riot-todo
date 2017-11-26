<task class="text-center">
  <h5>Title: { this.task.title }</h5>
  <h5>Content: { this.task.content }</h5>
  <h5>Created: { this.task.created }</h5>

  <script>
    if (!this.opts.id)
      this.router.navigate('/')

    this.task = this.$todo.tasks.find(task => task.id == this.opts.id)
  </script>
</task>
