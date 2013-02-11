class VideoTracker.Routers.Screencasts extends Backbone.Router
  routes:
    ''                   : 'index'
    'videos/new' : 'new'
    'videos/:id'   : 'show'


  initialize: (options) ->
    # Refactored below out...
    # @collection = new VideoTracker.Collections.Screencasts()
    # @collection.fetch()

  index: ->
    screencasts = new VideoTracker.Collections.Screencasts
    view = new VideoTracker.Views.ScreencastsIndex(collection: screencasts)
    screencasts.fetch()

  new: ->
    screencast = new VideoTracker.Models.Screencast
    screencasts = new VideoTracker.Collections.Screencasts
    view = new VideoTracker.Views.ScreencastNew({collection: screencasts, model: screencast})
    view.render()
    # moved below to view bind
    # screencasts.bind 'add', =>
    #   @navigate '', {trigger: true}

  show: (id) ->
    screencast = new VideoTracker.Models.Screencast id: id
    view = new VideoTracker.Views.ScreencastShow model: screencast
    screencast.fetch()
    #collection = new VideoTracker.Collections.Screencasts [screencast]
    # screencast = @collection.get(id)
    # view = new VideoTracker.Views.ScreencastShow(model: screencast)
    # $('#container').html(view.render().el)