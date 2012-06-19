$ ->
  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  }
  window.app = {templates: {}}
  app.router = new Router()
  window.Articles = {}
  Articles.home = new Models.Article({
    title: "Welcome to JS Wiki!"
    body: "This is the wiki I made."
  })
  window.Views.articleView = new Views.articleView(model: Articles.home)
  window.Views.articleEditView = new Views.articleEditView(model: new window.Models.Article())
  Templates.fetch app, ->
    Backbone.history.start()
