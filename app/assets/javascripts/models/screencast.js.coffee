class VideoTracker.Models.Screencast extends Backbone.Model
  url: ->
    return "/videos/" + this.get('id') + ".json"

  # parse: (resp, options) ->
  #   return @attributes if options.status is 204
  #   resp