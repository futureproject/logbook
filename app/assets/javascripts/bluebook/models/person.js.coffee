class Bluebook.Models.Person extends Backbone.Model

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
  comparator: 'first_name'
  initialize: ->
    @on 'reset', @onreset
    @listenTo Backbone, 'people:filter', @sendFiltered

  onreset: ->
    Backbone.trigger 'people:reset', @models

  sendFiltered: (rules) ->
    subset = @where rules
    Backbone.trigger 'people:filtered', subset
