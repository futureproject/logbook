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
    @on 'reset add', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed

  model: dream.Models.Person
  url: '/people'
  comparator: (person) -> person.get('first_name')

  broadcast: ->
    Backbone.trigger 'peopleCollection:changed', @

  setRemote: ->
    #@local = false
