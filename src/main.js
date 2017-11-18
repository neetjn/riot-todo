import './assets/styles/main.scss'

import riot from 'riot'
import format from 'riot-format'
import router from './router'
import todo from './services/todo'

import './components/header.tag'
import './components/footer.tag'
import './components/code-sponsor.tag'
import './components/todo-list.tag'
import './components/create-todo.tag'
import './app.tag'

format(riot)
riot.mixin(router)
riot.mixin(todo())
riot.mount('app')
