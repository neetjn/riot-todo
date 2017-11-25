<profile>
  <h1 class="text-center">{ opts.username }'s Tasks</h1>
  <todo-list filter={ opts.username }></todo-list>

  <script>
    if (!this.$todo.tasks.length) {
      this.router.navigate('/')
    }

    this.$todo.on('delete', () => {
      if (this.router.$state.name === 'profile') {
        console.log('called?')
        //this.router.navigate('/')
      }
    })
  </script>
</profile>
