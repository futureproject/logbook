class dream.Models.Person extends Backbone.Model
  urlRoot: '/people'
  defaults: ->
    first_name: ''
    last_name: ''
    role: 'student'
    grade: '9'
    dream_team: true
    school_id: dream.USER.school.id

  toJSON: ->
    _.omit @attributes, 'selected'

  select: ->
    @set('selected', true)
    Backbone.trigger('person:selected', @)

  validate: (attrs) ->
    return 'Name me!' if !attrs.first_name? || !attrs.last_name?

class dream.Collections.People extends Backbone.Collection
  initialize: ->
    @on 'reset add', @broadcast
    @on 'add', @clearSelection

  model: dream.Models.Person
  url: '/people'

  select: (person) ->
    @each (p) -> if p == person then p.select() else p.unset('selected')
    return person

  clearSelection: ->
    @each (person) -> person.unset('selected')
    return @

  broadcast: ->
    Backbone.trigger 'peopleCollection:changed', @
