class VideoTracker.Views.ScreencastsIndex extends Backbone.View
  el: "#container"
  template: JST['videos/index']

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    $(@el).html(@template())
    _.each(@collection.models, @appendEntry)
    this

  appendEntry: (entry) ->
    view = new VideoTracker.Views.Screencast(model: entry)
    @$('.screencasts').append(view.render().el)

