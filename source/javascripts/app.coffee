$ ->
  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  }

  window.app = {
    templates: {}
    router: new Router()
    articles: {}
    views: {}
  }

  app.articles.home = new Models.Article({
    title: "Welcome to JS Wiki!"
    body: "This is the wiki I made."
  })

  app.articles.help = new Models.Article({
    title: "Welcome to help page."
    body: "Here is some useful help information."
  })

  app.views.articleView = new Views.articleView({
    model: app.articles.home
    el: $('.articleView')
  })


  Templates.fetch app, ->
    Backbone.history.start()
