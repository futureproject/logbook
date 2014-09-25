class dream.Models.Engagement extends Backbone.Model
  urlRoot: '/engagements'
  defaults: ->
    school_id: dream.USER.school.id
    kind: 'Dream Team Meeting'

class dream.Collections.Engagements extends Backbone.Collection
  initialize: ->
    @bootstrap()
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'engagement:created', @addModel
    @listenTo Backbone, 'engagements:bootstrap', @bootstrap
    @listenTo Backbone, 'engagements:findByAttendeeId', @findByAttendeeId

  model: dream.Models.Engagement

  url: '/engagements'

  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))

  broadcast: -> Backbone.trigger 'engagements:changed', @

  refresh: (e) ->
    length = @length
    @fetch
      remote: true
      success: (collection, response, options) ->
        collection.syncDirtyAndDestroyed() if navigator.onLine
        collection.broadcast() if length != collection.length

  # add one model and broadcast
  addModel: (model) ->
    @add(model)
    @broadcast()

  # get models into this collection
  # pull from localStorage first
  # if that comes up empty, pulls from network
  bootstrap: ->
    if @length > 0
      @broadcast()
    else
      @fetch
        remote: false
        success: =>
          if @length > 0
            @broadcast()
          else
            @fetch
              remote: true
              success: =>
                @broadcast()

  findByAttendeeId: (id, callback) ->
    subset = @filter (project) ->
      engagements = _.map project.get('attendee_ids'), (key) -> parseInt(key)
      _.contains engagements, parseInt(id)
    callback.call(@, subset) if callback?
