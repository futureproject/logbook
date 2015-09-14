class ds.NotificationView extends Backbone.View
  initialize: (args={}) ->
    @views = []
    @msg = args.message
  className: 'notification animation-fallin'
  events:
    'click .hide': 'hide'

  render: ->
    @$el.html(@msg)
    @
