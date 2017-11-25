import mocks from './mocks'

class ToDo {

  /**
   * Simple ToDo mixin service.
   * @param {array} tasks - Array of task objects to reference.
   */
  constructor(tasks) {
    this.tasks = tasks
    riot.observable(this)
  }

  /**
   * Finds task by it's id.
   * @param {string} taskId - Id of task to find.
   */
  _findTaskById(taskId) {
    var task = this.tasks.findIndex((task) => {
      return task.id == taskId
    })

    if (typeof task == 'undefined')
      throw Error('Task marked for deletion could not be found')

    return task
  }

  /**
   * Add a new task.
   * @param {object} task - Task object to push.
   */
  addTask(task) {
    const self = this

    return new Promise((resolve) => {
      let created = new Date()
      task.id = created.getTime().toString(16)
      task.created = created
      task.completed = false
      self.tasks.push(task)
      this.trigger('add')
      resolve()
    })
  }

  /**
   * Delete an existing task.
   * @param {string} taskId - Id of task to delete.
   */
  deleteTask(taskId) {
    const self = this

    return new Promise((resolve) => {
      self.tasks.splice(this._findTaskById(taskId, 1), 1)
      this.trigger('delete')
      resolve()
    })
  }

  /**
   * Modify existing task.
   * @param {object} task - Updated task object.
   */
  editTask(taskId, task) {
    const self = this

    return new Promise((resolve) => {
      let found = self.tasks[this._findTaskById(taskId)]
      found = Object.assign(found, task)
      found.edited = new Date()
      this.trigger('edit')
      resolve()
    })
  }

}

export default function() {
  return {
    $todo: new ToDo(mocks.tasks.slice())
  }
}
