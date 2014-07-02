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
    @currentFilter = { core: true }
    @on 'reset', @onReset
    @on 'sort', @onSort
    @listenTo Backbone, 'people:edited', @sort
    @listenTo Backbone, 'people:filter', @sendModels

  onReset: ->
    Backbone.trigger 'people:reset', @where(@currentFilter)

  sendModels: (rules) ->
    @currentFilter = rules
    Backbone.trigger 'people:filtered', @where(@currentFilter)

  onSort: ->
    Backbone.trigger 'people:filtered', @where(@currentFilter)


