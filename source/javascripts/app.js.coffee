underscoreDefaults = ->
  _.templateSettings = interpolate: /\{\{(.+?)\}\}/g
  Backbone.Model.get = (attr)->
    return @virtualAttributes[attr].call() if @virtualAttributes[attr]
    return @attributes[attr]

createDefaultArticles = (app, callback)->
  $.ajax
    url: 'pages/home.txt'
    success: (res)->
      article = new Models.Article
        title: "Welcome to JS Wiki!"
        permalink: 'home'
        body: res
      ArticleCollection.save(article)
      callback.call()

  articles = [
    new Models.Article
      title: "Welcome to JS Wiki!"
      permalink: 'home'
      body: $('#homePage').text()
    new Models.Article
      title: "Welcome to help page."
      permalink: 'help'
      body: "Here is some useful help information."
  ]

  localStorage.articles_list = [] unless localStorage.getItem("articles_list")?
  _.each articles, (article)->
    unless localStorage.getItem("article_#{article.get('permalink')}")?
      article.ghetto_save()

createViews = ->
  articleView: new Views.articleView
    el: $('.articleView')
  pagesView: new Views.pagesView
    el: $('.articleView')

$ ->
  underscoreDefaults()

  window.app =
    templates: Templates.fetch()
    router: new Router()
    views: createViews()

  createDefaultArticles app, ->
    Backbone.history.start()
