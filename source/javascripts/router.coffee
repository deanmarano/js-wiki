  window.Router = Backbone.Router.extend
    routes: {
      '': 'welcome',
      ":query/edit": "edit",     #edit
      "new": "new",     #new
      ":query": "show_article",
    },

    welcome: ->
      console.log('Router: /')
      app.views.articleView.render()

    new: ->
      console.log("Router: new")
      app.views.articleView.model = new Models.Article()
      app.views.articleView.edit()

    edit: (permalink)->
      console.log("Router: edit")
      app.views.articleView.model = @find_article(permalink)
      app.views.articleView.edit()

    show_article: (permalink)->
      console.log("Router: looking for article #{permalink}")
      app.views.articleView.model = @find_article(permalink)
      app.views.articleView.render()

      console.log("hello from search")
    find_article: (permalink)->
      article = localStorage.getItem("model_#{permalink}")
      articleHash = if article? then JSON.parse(article) else {permalink: permalink}
      articleModel = new Models.Article(articleHash)


