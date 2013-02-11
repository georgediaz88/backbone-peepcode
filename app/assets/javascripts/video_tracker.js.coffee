window.VideoTracker =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new VideoTracker.Routers.Screencasts()
    Backbone.history.start()

$(document).ready ->
  VideoTracker.init()
