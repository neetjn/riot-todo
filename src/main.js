import './assets/styles/main.scss'

import riot from 'riot'
import ToDo from './services/todo'
import mock from './services/mocks'

riot.mixin({ $todo: new ToDo(riot, mock.tasks) })
riot.mount('app')

import './router'
import './components'
import './app.tag'
