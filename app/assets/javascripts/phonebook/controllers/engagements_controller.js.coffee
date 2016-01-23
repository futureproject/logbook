class ds.EngagementsController extends Backbone.View
  initialize: ->
    @views = {}
    @collection = ds.collections.engagements
    @listenTo Backbone, "engagements:action", @action

  action: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

