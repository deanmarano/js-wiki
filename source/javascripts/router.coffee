  window.Router = Backbone.Router.extend
    routes: {
      '':               'welcome',
      "help":           "help",     #help
      "home":           "home",     #home
      "edit":           "edit",     #edit
      "new":           "new",     #new
      "search/:query":  "search",   #search/kiwis
    },

    welcome: ->
      console.log('Router: /')
      app.views.articleView.render()

    new: ->
      console.log("Router: new")
      app.views.articleView.model = new Models.Article()
      app.views.articleView.edit()

    edit: ->
      console.log("Router: edit")
      app.views.articleView.edit()

    help: ->
      console.log("Router: help")
      app.views.articleView.model = app.articles.help
      app.views.articleView.render()

    home: ->
      console.log("Router: home")
      app.views.articleView.model = app.articles.home
      app.views.articleView.render()

    search: (query)->
      console.log("hello from search")

