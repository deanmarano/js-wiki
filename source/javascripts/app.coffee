$ ->
  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  }

  window.app = {
    templates: {}
    router: new Router()
    views: {}
  }

  home = new Models.Article({
    title: "Welcome to JS Wiki!"
    permalink: 'home'
    body: "This is the wiki I made."
  })

  localStorage.setItem("model_home", JSON.stringify(home.toJSON())) unless localStorage.getItem('model_home')?

  help = new Models.Article({
    title: "Welcome to help page."
    permalink: 'help'
    body: "Here is some useful help information."
  })

  localStorage.setItem("model_help", JSON.stringify(help.toJSON())) unless localStorage.getItem('model_help')?

  app.views.articleView = new Views.articleView({
    model: home
    el: $('.articleView')
  })


  Templates.fetch app, ->
    Backbone.history.start()
