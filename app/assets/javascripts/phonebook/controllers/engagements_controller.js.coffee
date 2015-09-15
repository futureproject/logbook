class ds.EngagementsController extends Backbone.View
  el: "#phonebook"
  initialize: ->
    @views = {}
    @collection = new ds.EngagementsCollection
    @listenTo Backbone, "engagements:do", @do
    @listenTo Backbone, "engagements:persist", @saveEngagement
    @listenTo @collection, "add", @updateAttendees

  do: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  saveEngagement: (model) ->
    @collection.add model,
      at: 0

  updateAttendees: (model) ->
    Backbone.trigger "people:move_up", model.get('attendee_ids')

