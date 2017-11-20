<create-todo>
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

    <button class="is-success" type="button" onclick={ createTask }>Create Task</button>
  </form>

  <script>
    createTask() {
      const self = this

      self.$todo.addTask({
        assignee: this.refs.taskAssignee.value,
        title: this.refs.taskTitle.value,
        content: this.refs.taskContent.value
      }).then(() => {
        self.parent.update()
      })
    }
  </script>
</create-todo>
