class VideoTracker.Views.ScreencastShow extends Backbone.View
  el: "#container"
  template: JST['videos/show']

  events:
    'click .delete' : 'deleteItem'

  initialize: ->
    @model.on 'change', @render, @

  render: ->
    $(@el).html(@template(video: @model))
    @

  deleteItem: (e) ->
    e.preventDefault()
    @model.destroy url: "videos/#{@model.id}"
    window.location.hash = ""