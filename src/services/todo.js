import mocks from './mocks'

class ToDo {

  /**
   * Simple ToDo mixin service.
   * @param {array} tasks - Array of task objects to reference.
   */
  constructor(tasks) {
    this.tasks = tasks
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
    let created = new Date()
    task.id = created.getTime().toString(16)
    task.created = created
    this.tasks.push(Object.assign({}, task))
  }

  /**
   * Delete an existing task.
   * @param {string} taskId - Id of task to delete.
   */
  deleteTask(taskId) {
    this.tasks.splice(this._findTaskById(taskId, 1), 1)
  }

  /**
   * Modify existing task.
   * @param {object} task - Updated task object.
   */
  editTask(taskId, task) {
    let found = this.tasks[this._findTaskById(taskId)]
    found = Object.assign(found, task)
    found.edited = new Date()
  }

}

export default function() {
  return {
    $todo: new ToDo(mocks.tasks.slice())
  }
}
