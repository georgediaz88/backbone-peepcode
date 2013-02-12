class VideoTracker.Views.ScreencastNew extends Backbone.View
  el: "#container"
  template: JST["videos/new"]

  initialize: ->
    @collection.on('add', @addNewEntry, @)

  events:
    'submit #new_entry' : 'createEntry'

  render: ->
    $(@el).html(@template(video: @model))
    @$('form').validate
      rules:
        title: 'required'
        image: 'required'
    @

  addNewEntry: (entry) ->
    console.log entry
    window.location.hash = ""

  createEntry: (e) ->
    e.preventDefault()
    e.stopPropagation() #not sure if needed?
    attributes =
      title: @$('#title').val()
      image: @$('#image').val()
    @collection.create attributes,
      url: '/videos'
      wait: true
      success: -> $('#new_entry')[0].reset()
      error: @handlerErro

  handlerErro: (entry, response) ->
    if response.status == 422
      block = ''
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        block += "#{attribute} #{message}<br/>" for message in messages
      $('.alert').show().children('.error_list').html(block)
