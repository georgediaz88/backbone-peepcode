class VideoTracker.Views.ScreencastShow extends Backbone.View
  el: "#container"
  template: JST['videos/show']

  events:
    'click .delete' : 'deleteItem'
    'click .edit' : 'editItem'

  initialize: ->
    @model.on 'change', @render, @

  render: ->
    $(@el).html(@template(video: @model))
    @

  deleteItem: (e) ->
    e.preventDefault()
    @model.destroy url: "videos/#{@model.id}"
    window.location.hash = ""

  editItem: (e) ->
    e.preventDefault()
    window.location.hash = "videos/#{@model.id}/edit"