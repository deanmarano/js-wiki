  window.Router = Backbone.Router.extend
    routes: {
      '':             'index',
      ":query/edit":  "edit",     #edit
      "new":          "new",     #new
      "pages":   "pages"
      ":permalink":   "show_article"
    },

    index: ->
      console.log('Router: /')
      @show_article('home')

    new: ->
      console.log("Router: new")
      app.views.articleView.model = new Models.Article
        title: ''
        permalink: ''
        body: ''
      app.views.articleView.edit()

    edit: (permalink)->
      console.log("Router: edit")
      app.views.articleView.model = ArticleCollection.find(permalink)
      app.views.articleView.edit()

    pages: ->
      console.log('Router: pages')
      app.views.pagesView.render()

    show_article: (permalink)->
      console.log("Router: looking for article #{permalink}")
      app.views.articleView.model = ArticleCollection.find(permalink)
      app.views.articleView.render()
