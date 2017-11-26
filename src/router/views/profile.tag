<profile class="text-center">
  <h1>{ opts.username }'s Profile</h1>
  <h4>
    <small>Latest Task:</small> <a r-sref="/task/{this.latest.id}">{ this.latest.title }</a>
  </h4>
  <h2>
    Stats <small><i class="ico ico-right fi-graph-bar"></i></small>
  </h2>
  <div id="stats">
    <table>
      <tr>
        <th>Total</th>
        <th>Completed</th>
        <th>Incomplete</th>
      </tr>
      <tr>
        <td>{ total() }</td>
        <td>{ completed() }</td>
        <td>{ incomplete() }</td>
      </tr>
    </table>
  </div>

  <script>
    this.tasks = this.$todo.tasks.filter(task => task.assignee === this.opts.username)
    if (!this.tasks.length)
      this.router.navigate('/')

    this.latest = this.tasks.sort((a, b) => a.created.getTime() < b.created.getTime())[0]

    total() {
      return this.tasks.length
    }

    completed() {
      return this.tasks.filter(task => task.completed).length
    }

    incomplete() {
      return this.tasks.filter(task => !task.completed).length
    }
  </script>
</profile>
