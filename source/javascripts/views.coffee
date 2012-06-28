window.Views = {}

Views.articleView = Backbone.View.extend({
  events: {
    'click a.edit': 'edit'
    'click a.save': 'save'
  }
  save: ->
    @model.set('title', @$el.find('.titlebox').val())
    @model.set('body', @$el.find('.editbox').val())
    @render()

  edit: ->
    @renderTemplate(app.templates.articleEditTemplate, @model.toJSON())

  renderTemplate: (template, data)->
    templateFn = _.template(template)
    html = templateFn(data)
    @$el.html(html)

  render: ->
    converter = Markdown.getSanitizingConverter()
    data = {
      title: @model.get('title')
      body: converter.makeHtml(@model.get('body'))
    }
    @renderTemplate(app.templates.articleViewTemplate, data)
})
