class ds.EngagementsController extends Backbone.View
  initialize: ->
    @views = {}
    @collection = ds.collections.engagements
    @listenTo Backbone, "engagements:action", @action
    @listenTo Backbone, "engagements:persist", @saveEngagement
    @listenTo Backbone, "engagements:find", @findEngagements
    @listenTo @collection, "add", @updateAttendees

  action: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  saveEngagement: (model) ->
    console.log "persisting engagement!"
    console.log model
    @collection.add model,
      at: 0

  updateAttendees: (model) ->
    Backbone.trigger "people:move_up", model.get('attendee_ids')

  # search for engagements, either by custom query_type
  # or by supplied query param [ids]
  findEngagements: (args) ->
    args ||= {}
    models = []
    if args.query_type == "attendee_ids"
      models = @collection.getByAttendeeIds args.query
    else
      models = @findMultiple args.query
    Backbone.trigger('engagements:found', models)
