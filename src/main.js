import './assets/styles/main.scss'

/*eslint-disable no-unused-vars */
import riot from 'riot'
import router from './router'
import format from 'riot-format'
import todo from './services/todo'

import './components/header.tag'
import './components/footer.tag'
import './components/todo-list.tag'
import './components/create-todo.tag'
import './app.tag'

format(riot)
riot.mixin(todo())
riot.mount('app')
/*eslint-enable no-unused-vars */
