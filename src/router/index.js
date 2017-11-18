import Router from 'riot-view-router'

import './views/home.tag'
import './views/profile.tag'
import './views/not-found.tag'

const options = {
  debugging: true,
  defaultState: 'home',
  fallbackState: '404'
}

const states = [
 {
   name: 'home',
   route: '/',
   tag: 'home',
   title: 'Home'
  },
 {
   name: '404',
   route: '/notfound',
   tag: 'not-found',
   title: '404 Not Found'
 },
 {
   name: 'profile',
   route: '/profile/:username',
   tag: 'profile',
   title: 'Profile'
 }
]

export default new Router(options, states)
