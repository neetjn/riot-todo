<profile>
  <h1 class="text-center">{ opts.username }'s Profile</h1>
  <div class="row">
    <div class="six columns">
      <h5>Number of tasks: { this.tasks.length }</h5>
      <h5>
        Latest Task: <a r-sref="/tasks/{this.latest.id}">{ this.latest.title }</a>
      </h5>
    </div>
    <div class="six columns">
      <h1></h1>
    </div>
  </div>

  <script>
    this.tasks = this.$todo.tasks.filter(task => task.assignee === this.opts.username)
    this.latest = this.tasks.sort((a, b) => a.created.getTime() < b.created.getTime())[0]

    if (!this.tasks.length)
      this.router.navigate('/')
  </script>
</profile>
