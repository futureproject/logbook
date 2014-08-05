class dream.Models.Project extends Backbone.Model
  urlRoot: '/projects'
  defaults: ->
    name: null
    school_id: dream.USER.school.id

  validate: (attrs) ->
    return 'Name me!' if !attrs.name?

class dream.Collections.Projects extends Backbone.Collection
  initialize: ->
    @autoRefreshed = false
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'project:created', @addModel

  model: dream.Models.Project

  url: '/projects'

  comparator: (project) -> - project.get('id')

  broadcast: -> Backbone.trigger 'projectsCollection:changed', @

  refresh: (e) ->
    length = @length
    @fetch
      remote: true
      success: (collection, response, options) ->
        collection.syncDirtyAndDestroyed() if navigator.onLine
        collection.broadcast() if length != collection.length

  addModel: (model) ->
    @add(model)
    @broadcast()
