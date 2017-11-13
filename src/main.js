import 'skeleton-css/css/normalize.css'
import 'skeleton-css/css/skeleton.css'
import 'animate.css/animate.min.css'
import 'ionicons/dist/css/ionicons.min.css'

import riot from 'riot'
import router from './router'

import './components/header.tag'
import './components/footer.tag'
import './components/sticky.tag'
import './app.tag'


riot.mixin(router)
riot.mount('app')
