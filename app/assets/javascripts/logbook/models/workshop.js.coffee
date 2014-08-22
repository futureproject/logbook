class dream.Models.Workshop extends Backbone.Model
  urlRoot: '/workshops'
  defaults: ->
    school_id: dream.USER.school.id
    kind: 'Dream Team Meeting'

class dream.Collections.Workshops extends Backbone.Collection
  initialize: ->
    @bootstrap()
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'workshop:created', @addModel
    @listenTo Backbone, 'workshops:bootstrap', @bootstrap
    @listenTo Backbone, 'workshops:findByAttendeeId', @findByAttendeeId

  model: dream.Models.Workshop

  url: '/workshops'

  comparator: (workshop) ->
    - Date.parse(workshop.get('date'))

  broadcast: -> Backbone.trigger 'workshops:changed', @

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
      workshops = _.map project.get('attendee_ids'), (key) -> parseInt(key)
      _.contains workshops, parseInt(id)
    callback.call(@, subset) if callback?
