import './assets/styles/main.scss'

import riot from 'riot'
import 'riot-animore'
import format from 'riot-format'
import ToDo from './services/todo'
import mock from './services/mocks'

format(riot)
riot.mixin({ $todo: new ToDo(riot, mock.tasks) })
riot.mount('app')

import './router'
import './components'
import './app.tag'
