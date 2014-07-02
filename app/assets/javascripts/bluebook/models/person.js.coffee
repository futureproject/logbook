class Bluebook.Models.Person extends Backbone.Model
  urlRoot: '/people'
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Bluebook.USER.school.id
    grade: 9
    core: true

class Bluebook.Collections.PeopleCollection extends Backbone.Collection
  model: Bluebook.Models.Person
  url: '/people'
  local: !navigator.onLine
  comparator: 'first_name'
  initialize: ->
    @defaultFilter = { core: true }
    @on 'reset', @onReset
    @listenTo Backbone, 'people:filter', @sendModels

  onReset: ->
    Backbone.trigger 'people:reset', @where(@defaultFilter)

  sendModels: (rules) ->
    subset = @where rules
    Backbone.trigger 'people:filtered', subset
