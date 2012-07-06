underscoreDefaults = ->
  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  }

createDefaultArticles = (app)->
  articles = [
    new Models.Article
      title: "Welcome to JS Wiki!"
      permalink: 'home'
      body: "This is the wiki I made."
    new Models.Article
      title: "Welcome to help page."
      permalink: 'help'
      body: "Here is some useful help information."
  ]

  _.each articles, (article)->
    article.ghetto_save() unless app.router.find_article(article.get('permalink'))?

createViews = ->
  articleView: new Views.articleView
    el: $('.articleView')

$ ->
  underscoreDefaults()

  window.app =
    templates: Templates.fetch()
    router: new Router()
    views: createViews()

  createDefaultArticles(app)

  Backbone.history.start()
