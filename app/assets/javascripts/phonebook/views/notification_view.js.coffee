class ds.NotificationView extends Backbone.View
  initialize: (args={}) ->
    @views = []
    @msg = args.message
  className: 'notification animation-dropin'
  events:
    'click .hide': 'hide'

  render: ->
    @$el.html(@msg)
    @
