window.Templates = {}

Templates.fetch = ->
  templates = []
  _.each [
    'articleViewTemplate'
    'articleEditTemplate'
    'articlePreviewTemplate'], (template)->
    templates[template] = $(".#{template}").html()
  templates
