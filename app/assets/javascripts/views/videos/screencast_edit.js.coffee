class VideoTracker.Views.ScreencastEdit extends Backbone.View
  el: "#container"
  template: JST["videos/edit"]

  initialize: ->
    @model.on 'change', @render, @

  events:
    'submit #reg_entry' : 'updateEntry'

  render: ->
    $(@el).html(@template(video: @model))
    @$('form').validate
      rules:
        title: 'required'
        image: 'required'
    @

  updateEntry: (e) ->
    e.preventDefault()
    attributes =
      title: @$('#title').val()
      image: @$('#image').val()
    @model.save attributes,
      wait: true
      success: -> window.location.hash = ''
      error: @handlerErro

  handlerErro: (entry, response) ->
    if response.status == 204 #technically a good response
      window.location.hash = ''
    else if response.status == 422
      block = ''
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        block += "#{attribute} #{message}<br/>" for message in messages
      $('.alert').show().children('.error_list').html(block)
