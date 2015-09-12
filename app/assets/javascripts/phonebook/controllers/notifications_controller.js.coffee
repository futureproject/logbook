class ds.NotificationsController extends Backbone.View
  initialize: ->
    @listenTo Backbone, "notification", @notify

  notify: (message, duration) ->
    duration ||= 3000
    notification = new ds.NotificationView
      message: message
    $('body').append notification.render().el
    if duration > 3000
      notification.$el.append "<div class='btn hide'>Got It</div>"
    window.setTimeout =>
      notification.hide()
    , duration
