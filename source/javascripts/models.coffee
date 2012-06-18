window.Models = {}

window.Models.Article = Backbone.Model.extend({
  defaults: {
    id: null
    title: "Whoops! This page doesn't exist yet."
    body: "If you'd like to create it, click here."
    tags: []
  }
})
