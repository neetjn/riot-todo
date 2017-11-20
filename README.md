<a target='_blank' rel='nofollow' href='https://app.codesponsor.io/link/ymhxqZ47jLBFuVrU2iywqLGC/neetjn/riot-todo'>
  <img alt='Sponsor' width='888' height='68' src='https://app.codesponsor.io/embed/ymhxqZ47jLBFuVrU2iywqLGC/neetjn/riot-todo.svg' />
</a>

# riot-todo

[![build](https://travis-ci.org/neetjn/riot-todo.svg?branch=master)](https://travis-ci.org/neetjn/riot-todo)

Todo web app created with Riot.js, SkeletonCSS, animate.css, and foundation-icons.

### About

This project was originally created to unit-test [py-component-controller](https://github.com/neetjn/py-component-controller), but was later revised as a general todo application to help learn and understand Riot.js workflow.

The design pattern used in this project is entirely opinionated.

### Why

Though React.js and Vue.js are currently in the spotlight, I find Riot.js to be a happy medium sharing the same phiolosphy (isolated web components), and carry less overhead.

### Structure

```
build/
├── webpack.conf.js
src/
├── assets/
│   ├── images/
│   └── styles/
│       └── *.scss
├── components/
│   └── *.tag
├── router/
│   ├── views/
│   |   └── *.tag
│   └── index.js
│       └── *.tag
├── services/
│   └── *.js
├── app.tag
└── main.js
```

This app uses webpack with the [riot-tag-loader](https://github.com/riot/tag-loader) to help bundle tags and other resources.

To simplify and modernize routing, this app uses [riot-view-router]() rather than the vanilla routing mechanisms for Riot.js; allowing us to route using tag views.

Rather than isolating functionality related to manipulating app data to individual tags and trying to funnel opts around, shared funtionality has been moved to `services`. This allows us to identify, control, and manage the manipulation of any data within our Riot.js application.

`app.tag` is our root tag, which should be mounted as soon as our router is instantiated. Using this development pattern, no other riot tag should need to be manually mounted.

### Technologies

* Riot.js 3
* riot-view-router
* Sass
* SkeletonCSS
* animate.css
* Foundation (icons)
* Webpack
  * riot-tag-loader
  * Webpack Extract Text Plugin
  * Webpack Google Font Plugin 

### Use

Bundles can be built like so,

```bash
npm run build
``` 

To serve the website,

```bash
npm run app
```

You may alternatively run the website in the background,

```
npm run app:detached
```

### Contributors

* **John Nolette** (john@neetgroup.net)

Contributing guidelines are as follows,

* Branches for bugs and features should be structued like so, `issue-x-username`.
* Include your name and email in the contributors list.

---
Copyright (c) 2017 John Nolette Licensed under the MIT license.
