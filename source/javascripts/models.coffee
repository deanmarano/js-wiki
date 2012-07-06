window.Models = {}

window.Models.Article = Backbone.Model.extend({
  defaults: {
    permalink: null
    title: "Whoops! This page doesn't exist yet."
    body: "If you'd like to create it, click here."
    tags: []
  }

  ghetto_save:->
    return unless @get('permalink')?
    localStorage.setItem(
      "article_#{@get('permalink')}"
      JSON.stringify(@toJSON()))
})
