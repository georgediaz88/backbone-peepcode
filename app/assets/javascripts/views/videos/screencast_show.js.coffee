class VideoTracker.Views.ScreencastShow extends Backbone.View
  el: "#container"
  template: JST['videos/show']

  initialize: ->
    @model.bind 'change', @render, @

  render: ->
    $(@el).html(@template(video: @model))
    @