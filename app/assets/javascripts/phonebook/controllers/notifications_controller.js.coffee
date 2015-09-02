class ds.NotificationsController extends Backbone.View
  initialize: ->
    @listenTo Backbone, "notify", @notify

  notify: (message) ->
    console.log message
