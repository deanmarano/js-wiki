window.Models = {}

window.Models.Article = Backbone.Model.extend({
  defaults: {
    permalink: null
    title: "Whoops! This page doesn't exist yet."
    body: "If you'd like to create it, click here."
    tags: []
  }

  bodyHTML: ->
    Markdown.getSanitizingConverter().makeHtml(@get('body'))

  getTemplateData: ->
    data = @toJSON()
    data.bodyHTML = @bodyHTML()
    data

  ghetto_save:->
    return unless @get('permalink')?
    ArticleCollection.save(@)
})

window.ArticleCollection = Backbone.Collection.extend {},
  model: Models.Article
  find: (permalink)->
    article = localStorage.getItem("article_#{permalink}")
    articleHash = if article? then JSON.parse(article) else {permalink: permalink}
    new Models.Article(articleHash)

  save: (model)->
    @push(model.get('permalink'))
    localStorage.setItem(
      "article_#{model.get('permalink')}"
      JSON.stringify(model.toJSON()))

  push: (permalink)->
    articleList = JSON.parse(localStorage.articleList || '[]')
    unless _.include articleList, permalink
      articleList.push permalink
      localStorage.articleList = JSON.stringify articleList

  import: (articles)->
    _.each articles, (article)->
      new Models.Article(article)

  export: ->
    _.map ArticleCollection.articles(), (a)->
      a.toJSON()

  articles: ->
    articleList = JSON.parse(localStorage.articleList || '[]')
    _.map articleList, (permalink)->
      ArticleCollection.find(permalink)
