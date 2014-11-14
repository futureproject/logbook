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
  remote: true
  comparator: 'first_name'
  initialize: ->
    @listenTo Backbone, 'network:online', @fetchFromServer

  fetchFromServer: ->
    @fetch()
