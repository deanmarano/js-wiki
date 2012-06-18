window.Templates = {}
templatesToLoad = [
  { name: 'articleViewTemplate', url: 'http://localhost:4567/partials/article.html'},
  { name: 'articleEditTemplate', url: 'http://localhost:4567/partials/articleEditTemplate.html'}
]

Templates.fetch = (callbackFn)->
  console.log 'Loading templates...'
  templatesLoaded = ->
    console.log 'Templates loaded!'
    callbackFn.call()

  successFn = (template)->
    (html)->
      Templates[template.name] = html
      templatesToLoad.splice(templatesToLoad.indexOf(template), 1)
      templatesLoaded() if templatesToLoad.length == 0

  for template in templatesToLoad
    $.ajax
      url: template.url
      success: successFn(template)

