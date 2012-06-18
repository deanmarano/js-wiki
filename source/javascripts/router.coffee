  window.Router = Backbone.Router.extend
    routes: {
      '':               'welcome',
      "help":           "help",     #help
      "home":           "home",     #home
      "edit":           "edit",     #edit
      "search/:query":  "search",   #search/kiwis
    },

    welcome: ->
      Views.articleView.render()
      console.log('Router: /')

    edit: ->
      console.log("Router: edit")
      Views.articleEditView.render()

    help: ->
      console.log("Router: help")
      Views.articleView.render()

    home: ->
      console.log("Router: home")
      Views.articleView.render(Articles.home)

    search: (query)->
      console.log("hello from search")

