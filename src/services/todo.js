export default class ToDo {

  /**
   * Simple ToDo mixin service.
   * @param {riot} instance - Riot reference.
   * @param {array} tasks - Array of task objects to reference.
   */
  constructor(instance, tasks) {
    this.$riot = instance
    this.$riot.observable(this)
    this.tasks = tasks
  }

  /**
   * Finds task by it's id.
   * @param {string} taskId - Id of task to find.
   */
  _findTaskById(taskId) {
    var task = this.tasks.findIndex(task => task.id == taskId)
    if (typeof task == 'undefined')
      throw Error('Task marked for deletion could not be found')
    return task
  }

  /**
   * Add a new task.
   * @param {object} task - Task object to push.
   */
  addTask(task) {
    const created = new Date()
    task.id = created.getTime().toString(16)
    task.created = created
    task.completed = false
    self.tasks.push(task)
    this.trigger('add')
  }

  /**
   * Delete an existing task.
   * @param {string} taskId - Id of task to delete.
   */
  deleteTask(taskId) {
    this.tasks.splice(this._findTaskById(taskId, 1), 1)
    this.trigger('delete')
  }

  /**
   * Delete an existing task.
   * @param {string[]} taskId - Id of task to delete.
   */
  deleteTasks(tasks) {
    tasks.forEach(task => this.tasks.splice(this._findTaskById(task.id, 1), 1))
    this.trigger('delete')
  }

  /**
   * Modify existing task.
   * @param {object} task - Updated task object.
   */
  editTask(taskId, task) {
    let found = self.tasks[this._findTaskById(taskId)]
    found = Object.assign(found, task)
    found.edited = new Date()
    this.trigger('edit')
  }

}
