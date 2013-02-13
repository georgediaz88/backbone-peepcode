class VideoTracker.Collections.Screencasts extends Backbone.Collection
  url: '/videos.json'
  model: VideoTracker.Models.Screencast

  comparator: (screencast) ->
    screencast.get('title')