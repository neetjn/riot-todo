import Router from 'riot-view-router'

const states = [
 {
   name: 'home',
   route: '/',
   tag:'home'
 },
 {
   name: '404',
   route: '/notfound',
   tag:'not-found'
 },
 {
   name: 'profile',
   route: '/profile/:username',
   tag: 'profile'
 }
]

const router = new Router({
  debugging: true,
  defaultState: 'home',
  fallbackState: '404',
  href: 'https://mysite.com/blogs'
}, states)

riot.mixin(router)
