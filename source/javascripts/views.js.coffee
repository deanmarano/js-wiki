window.Views = {}

Views.articleView = Backbone.View.extend({
  events: {
    'click a.edit': 'edit'
    'click a.save': 'save'
    'keyup .inputs': 'updateLivePreview'
  }

  updateModelFromInputs: (attribute)->
    @model.set(attribute, @$el.find(".#{attribute}-input").val())

  updateLivePreview: ()->
    _.each(['title', 'body', 'permalink'], @updateModelFromInputs, @)
    template = app.templates.articleViewTemplate
    html = _.template(template, @model.getTemplateData())
    $('.preview').html(html)

  save: ->
    _.each(['title', 'body', 'permalink'], @updateModelFromInputs, @)
    @model.ghetto_save()
    app.router.navigate(@model.get('permalink'), trigger: true)

  edit: ->
    @renderTemplate(app.templates.articleEditTemplate)

  renderTemplate: (template)->
    html = _.template(template, @model.getTemplateData())
    @$el.html(html)

  render: ->
    @renderTemplate(app.templates.articleViewTemplate)
})

Views.pagesView = Backbone.View.extend({
  render: ->
    titles = '<h1>Pages<h1><br />'
    template = app.templates.articlePreviewTemplate
    _.each ArticleCollection.articles(), (article)->
      titles += _.template(template, article.getTemplateData())

    console.log 'Views.pagesView: generating pages'
    @$el.html(titles)
})
