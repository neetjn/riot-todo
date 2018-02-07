import _ from 'lodash'

export default class ToDo {

  /**
   * Simple ToDo mixin service.
   * @param {riot} instance - Riot reference.
   * @param {array} tasks - Array of task objects to reference.
   */
  constructor(instance, tasks) {
    this.$riot = instance
    this.$riot.observable(this)
    this._tasks = tasks
  }

  get tasks() {
    return _.cloneDeep(this._tasks)
  }

  /**
   * Finds task by it's id.
   * @param {string} taskId - Id of task to find.
   */
  _findTaskById(taskId) {
    var task = this._tasks.findIndex(task => task.id == taskId)
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
    this._tasks.push(task)
    this.trigger('add')
  }

  /**
   * Delete an existing task.
   * @param {string} taskId - Id of task to delete.
   */
  deleteTask(taskId) {
    this._tasks.splice(this._findTaskById(taskId), 1)
    this.trigger('delete')
  }

  /**
   * Delete an existing task.
   * @param {string[]} tasks - Ids of tasks to delete.
   */
  deleteTasks(tasks) {
    tasks.forEach(id => this._tasks.splice(this._findTaskById(id), 1))
    this.trigger('delete')
  }

  /**
   * Modify existing task.
   * @param {object} task - Updated task object.
   */
  editTask(taskId, task) {
    let found = this._tasks[this._findTaskById(taskId)]
    found = Object.assign(found, task)
    found.edited = new Date()
    this.trigger('edit')
  }

}
