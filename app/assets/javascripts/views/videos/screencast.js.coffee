class VideoTracker.Views.Screencast extends Backbone.View
  tagName: 'li'
  template: JST['videos/screencast']
  #className: 'sets a class on the tag'

  events:
    'click a#title': 'toggleWatched'

  initialize: ->

  render: ->
    $(@el).addClass('watched') if @model.get('watched')
    $(@el).html(@template(video: @model))
    this

  toggleWatched: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @model.get('watched')
      @model.save watched: false,
        url: "videos/#{@model.id}/update_watched"
    else
      @model.save watched: true,
        url: "videos/#{@model.id}/update_watched"
    $(@el).toggleClass('watched')


