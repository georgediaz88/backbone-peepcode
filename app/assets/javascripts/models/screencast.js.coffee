class VideoTracker.Models.Screencast extends Backbone.Model
  url: ->
    return "/videos/" + this.get('id') + ".json"