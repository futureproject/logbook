class ds.SessionStorageController extends Backbone.View
  initialize: ->
    @collections =
      engagements: new ds.EngagementsCollection
    _.each @collections, (collection) ->
      collection.resetFromLocalStorage ->
        collection.syncDirtyAndDestroyed()
    @listen()

  listen: ->
    @listenTo Backbone, "session_storage:engagements:find", @findEngagements
    @listenTo Backbone, "session_storage:engagements:save", @saveEngagement
    @listenTo Backbone, "session_storage:engagements:destroy", @destroyEngagement
    @listenTo @collections.engagements, "add", (e) -> Backbone.trigger "engagement:created", e

  # search for engagements, either by custom query_type
  # or by supplied query param [ids]
  findEngagements: (args) ->
    args ||= {}
    models = []
    if args.query_type == "attendee_ids"
      models = @collections.engagements.getByAttendeeIds args.query
    else
      models = @collections.engagements.findMultiple args.query
    Backbone.trigger('session_storage:engagements:found', models)

  saveEngagement: (model) ->
    model.set('stored_in_session', true)
    @collections.engagements.add model,
      at: 0

  destroyEngagement: (model) ->
    m = @collections.engagements.find model
    if m? && confirm("Are you sure you want to delete this engagement?")
      m.destroy()

