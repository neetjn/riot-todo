<task class="text-center">
  <h5>Page Under Construction</h5>
  <h1>
    <i class="ico ico-left fi-safety-cone"></i>
  </h1>
  <p>Click <a r-sref="/">here</a> to return home</p>

  <script>
    if (!this.opts.id)
      this.router.navigate('/')

    this.task = this.$todo.tasks.find(task => task.id == this.opts.id)
  </script>
</task>
