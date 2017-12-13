import './assets/styles/main.scss'

import riot from 'riot'
import './router'
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
