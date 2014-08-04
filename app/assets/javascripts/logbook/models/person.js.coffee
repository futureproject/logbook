class dream.Models.Person extends Backbone.Model
  urlRoot: '/people'
  defaults: ->
    first_name: ''
    last_name: ''
    role: 'student'
    grade: '9'
    dream_team: true
    school_id: dream.USER.school.id

  validate: (attrs) ->
    return 'Name me!' if !attrs.first_name? || !attrs.last_name?

class dream.Collections.People extends Backbone.Collection
  initialize: ->
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @refresh
    @listenTo Backbone, 'person:created', @addModel

  model: dream.Models.Person
  url: '/people'
  comparator: (person) -> person.get('first_name')

  broadcast: -> Backbone.trigger 'peopleCollection:changed', @

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
