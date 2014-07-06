class Bluebook.Models.Person extends Backbone.Model
  urlRoot: '/people'
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Bluebook.USER.school.id
    grade: 11
    core: true

class Bluebook.Collections.PeopleCollection extends Backbone.Collection
  model: Bluebook.Models.Person
  url: '/people'
  local: !navigator.onLine
  comparator: 'first_name'
  initialize: ->
    @on 'change:first_name', @onChange
    @on 'change:last_name', @onChange
    @listenTo Backbone, 'people:filter', @sendModels

  onChange: ->
    @sort()
    @sendModels(null, null, @lastFilter)

  sendModels: (collection, info, rules) ->
    if rules?
      @lastFilter = rules
      Backbone.trigger 'people:models', @where(rules)
    else
      Backbone.trigger 'people:models', @models


