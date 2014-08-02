class dream.Models.Person extends Backbone.Model
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

class dream.Collections.People extends Backbone.Collection
  initialize: ->
    @on 'reset add remove', @broadcast
    @on 'add', @clearSelection

  model: dream.Models.Person
  url: '/people'

  select: (person) ->
    @each (p) -> if p == person then p.select() else p.unset('selected')

  clearSelection: -> @each (person) -> person.unset('selected')

  broadcast: ->
    Backbone.trigger 'peopleCollection:changed', @
