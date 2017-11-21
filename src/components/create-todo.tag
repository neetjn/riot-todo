<create-todo>
  <alert class="is-danger animated bounceIn" if={error}>
    <p class="text-center">
      <i class="ico ico-left fi-prohibited"></i> Form Not Completed
    </p>
  </alert>
  <form>
    <label for="taskAssignee">Assignee</label>
    <input
      class="u-full-width"
      type="text"
      placeholder="John Doe"
      id="taskAssignee"
      ref="taskAssignee" />

    <label for="taskTitle">Title</label>
    <input
      class="u-full-width"
      type="text"
      placeholder="Call Jane"
      id="taskTitle"
      ref="taskTitle" />

    <label for="taskContent">Content</label>
    <textarea
      class="u-full-width"
      placeholder="Call Jane …"
      id="taskContent"
      ref="taskContent"></textarea>

    <button class="is-success u-pull-right" type="button" onclick={ createTask }>Create Task</button>
  </form>

  <script>
    createTask() {
      const self = this

      let assignee = this.refs.taskAssignee.value.trim()
      let title = this.refs.taskTitle.value.trim()
      let content = this.refs.taskContent.value.trim()

      if (!assignee.length || !title.length || !content.length)
        self.error = true
      else {
        self.$todo.addTask({
          assignee,
          title,
          content
        }).then(() => {
          self.error = false
          self.parent.update()
        })
      }
      self.update()
    }
  </script>
</create-todo>
