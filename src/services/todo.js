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
    var task

    this.tasks.find((task, index) => {
      if (task.id == taskId) {
        task = index
        return true
      }
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
    let created = new Date().getTime()
    task.id = created.toString(16)
    task.created = created
    this.tasks.push(Object.assign({}, task))
  }

  /**
   * Delete an existing task.
   * @param {string} taskId - Id of task to delete.
   */
  deleteTask(taskId) {
    this.tasks.splice(this._findTaskById(taskId, 1))
  }

  /**
   * Modify existing task.
   * @param {object} task - Updated task object.
   */
  editTask(task) {
    let found = this._findTaskById(task.id)
    task.edited = new Date().getTime()
    this.tasks[0] = Object.assign(this.tasks[0], task)
  }

}

export default function(riot) {
  return {
    $todo: new ToDo(Object.assign({}, mocks.tasks))
  }
}
