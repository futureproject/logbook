class dream.Models.Project extends Backbone.Model
  initialize: ->
    @set('leader_ids', []) if !@get('leader_ids')?
    @set('participant_ids', []) if !@get('participant_ids')?

  urlRoot: '/projects'
  defaults: ->
    name: null
    school_id: dream.USER.school.id
    leader_ids: []
    participant_ids: []

  validate: (attrs) ->
    return 'Name me!' if !attrs.name?

class dream.Collections.Projects extends Backbone.Collection
  initialize: ->
    @bootstrap()
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'project:created', @addModel
    @listenTo Backbone, 'projects:bootstrap', @bootstrap
    @listenTo Backbone, 'projects:findByLeaderId', @findByLeaderId
    @listenTo Backbone, 'projects:findByParticipantId', @findByParticipantId

  model: dream.Models.Project

  url: '/projects'

  comparator: (project) -> - project.get('id')

  broadcast: -> Backbone.trigger 'projects:changed', @

  # fetch new data from the server
  # broadcast models if there is new data
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

  findByLeaderId: (id, callback) ->
    subset = @filter (project) ->
      leaders = _.map project.get('leader_ids'), (key) -> parseInt(key)
      _.contains leaders, parseInt(id)
    callback.call(@, subset) if callback?

  findByParticipantId: (id, callback) ->
    subset = @filter (project) ->
      participants = _.map project.get('participant_ids'), (key) -> parseInt(key)
      _.contains participants, parseInt(id)
    callback.call(@, subset) if callback?
