window.Models = {}

window.Models.Article = Backbone.Model.extend({
  defaults: {
    id: null
    permalink: null
    title: "Whoops! This page doesn't exist yet."
    body: "If you'd like to create it, click here."
    tags: []
  }

  ghetto_save:->
    localStorage.setItem(
      "model_#{@get('permalink')}"
      JSON.stringify(@toJSON()))
})
