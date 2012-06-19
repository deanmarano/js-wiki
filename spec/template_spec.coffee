describe "Templates", ->
  describe 'when a template is recieved', ->
    it "doesn't call the callback when there are templates remaining.", ->
      Templates.templatesToLoad = [{name: 'template-name'}, {name: 'template-name2'}]
      Templates.successFn({templates: {}}, Templates.templatesToLoad[0])()
      expect(Templates.areTemplatesLoaded()).toBe(false)

    it "calls the callback when there are no templates remaining.", ->
      Templates.templatesToLoad = [{name: 'template-name'}]
      spyOn Templates, 'templatesLoaded'
      Templates.successFn({templates: {}}, Templates.templatesToLoad[0])()
      expect(Templates.templatesLoaded).toHaveBeenCalled()
