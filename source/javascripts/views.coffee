window.Views = {}

Views.articleView = Backbone.View.extend({
  events: {
    'click a.edit': 'edit'
    'click a.save': 'save'
  }

  updateModelFromInputs: (attribute)->
    @model.set(attribute, @$el.find(".#{attribute}-input").val())

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
