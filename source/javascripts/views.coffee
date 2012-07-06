window.Views = {}

Views.articleView = Backbone.View.extend({
  events: {
    'click a.edit': 'edit'
    'click a.save': 'save'
  }
  save: ->
    _.each(['title', 'body', 'permalink'], (attribute)->
      @model.set(attribute, @$el.find(".#{attribute}-input").val())
    , @)
    @model.ghetto_save()
    app.router.navigate(@model.get('permalink'), trigger: true)

  edit: ->
    @renderTemplate(app.templates.articleEditTemplate, @model.toJSON())

  renderTemplate: (template, data)->
    html = _.template(template, data)
    @$el.html(html)

  render: ->
    data = @model.toJSON()
    data.body = Markdown.getSanitizingConverter().makeHtml(@model.get('body'))
    @renderTemplate(app.templates.articleViewTemplate, data)
})
