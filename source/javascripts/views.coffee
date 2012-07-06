window.Views = {}

Views.articleView = Backbone.View.extend({
  events: {
    'click a.edit': 'edit'
    'click a.save': 'save'
  }
  save: ->
    @model.set('title', @$el.find('.titlebox').val())
    @model.set('body', @$el.find('.editbox').val())
    @model.set('permalink', @$el.find('.permalink').val())
    localStorage.setItem("model_#{@model.get('permalink')}", JSON.stringify(@model))
    app.router.navigate(@model.get('permalink'), trigger: true)

  edit: ->
    @renderTemplate(app.templates.articleEditTemplate, @model.toJSON())

  renderTemplate: (template, data)->
    templateFn = _.template(template)
    html = templateFn(data)
    @$el.html(html)

  render: ->
    converter = Markdown.getSanitizingConverter()
    data = @model.toJSON()
    data.body = converter.makeHtml(@model.get('body'))
    @renderTemplate(app.templates.articleViewTemplate, data)
})
