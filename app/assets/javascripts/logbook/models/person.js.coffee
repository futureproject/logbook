class dream.Models.Person extends Backbone.Model
  defaults: ->
    name: null
    school_id: dream.USER.school.id

  initialize: ->
    @on('change:selected', @broadcastIfShowing)

  toJSON: ->
    _.omit @attributes, 'selected'

  broadcastIfShowing: ->
    Backbone.trigger('person:selected', @) if @has('selected')

class dream.Collections.People extends Backbone.Collection
  initialize: ->
    @on 'reset add remove', @broadcast

  model: dream.Models.Person
  url: '/people'
  select: (person) ->
    @each (p) ->
      if p == person
        p.set('selected', true)
      else
        p.unset('selected')

  broadcast: ->
    Backbone.trigger 'peopleCollection:changed', @
