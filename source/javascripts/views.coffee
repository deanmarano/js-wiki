window.Views = {}

Views.articleView = Backbone.View.extend({
  tagName: 'div',
  className: 'articleView',
  render: ->
    template = _.template(app.templates.articleViewTemplate)
    html = template(this.model.toJSON())
    $(this.tagName + '.' + this.className).html(html)
})

Views.articleEditView = Backbone.View.extend({
  tagName: 'div',
  className: 'articleView',
  events: {
    'click a.save': 'save'
  }
  save: ->
    console.log('save called!')
  render: ->
    template = _.template(app.templates.articleEditTemplate)
    html = template(this.model.toJSON())
    $(this.tagName + '.' + this.className).html(html)
})

