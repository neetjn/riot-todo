import './assets/styles/main.scss'

import riot from 'riot'
import router from './router'

import './components/header.tag'
import './components/footer.tag'
import './components/code-sponsor.tag'
import './app.tag'


riot.mixin(router)
riot.mount('app')
