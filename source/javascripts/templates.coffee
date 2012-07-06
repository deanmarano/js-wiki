window.Templates = {}

Templates.fetch = ->
  templates = []
  _.each ['articleViewTemplate', 'articleEditTemplate'], (template)->
    templates[template] = $(".#{template}").html()
  templates
