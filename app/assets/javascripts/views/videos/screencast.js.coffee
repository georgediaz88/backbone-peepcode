class VideoTracker.Views.Screencast extends Backbone.View
  tagName: 'li'
  #className: 'sets a class on the tag'
  template: JST['videos/screencast']
  # Using a template here to clean up the render a lil bit ...

  events:
    'click ': 'toggleWatched'

  initialize: ->

  render: ->
    $(@el).addClass('watched') if @model.get('watched')
    $(@el).html(@template(video: @model))
    this

  toggleWatched: (e) ->
    e.stopPropagation()
    if @model.get('watched')
      @model.set({'watched': false}).save()
    else
      @model.set({'watched': true}).save()
    $(@el).toggleClass('watched')


