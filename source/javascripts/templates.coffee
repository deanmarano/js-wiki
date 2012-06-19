window.Templates = {}
Templates.templatesToLoad = [
  { name: 'articleViewTemplate', url: 'http://localhost:4567/partials/article.html'},
  { name: 'articleEditTemplate', url: 'http://localhost:4567/partials/articleEditTemplate.html'}
]

Templates.successFn = (app, template)->
  (html)->
    app.templates[template.name] = html
    index = Templates.templatesToLoad.indexOf(template)
    Templates.templatesToLoad[index].loaded = true
    Templates.templatesLoaded() if Templates.areTemplatesLoaded()

Templates.areTemplatesLoaded = ->
  remainingTemplates = _.filter Templates.templatesToLoad, (template)->
    template.loaded != true
  remainingTemplates.length == 0

Templates.templatesLoaded = ->
  console.log 'Templates loaded!'
  Templates.callbackFn.call()

Templates.fetch = (app, callbackFn)->
  Templates.callbackFn = callbackFn
  console.log 'Loading templates...'

  for template in Templates.templatesToLoad
    $.ajax
      url: template.url
      success: Templates.successFn(app, template)
