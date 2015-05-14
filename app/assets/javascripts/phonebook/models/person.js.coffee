class Phonebook.Models.Person extends Backbone.Model
  className: 'Person'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Phonebook.user.get('school_id')
    school_name: ''
    grade: 11
    dream_team: false
    attending: null
    notes: null
    email: null
    phone: null

  toJSON: ->
    _.omit _.clone(@attributes), ['attending', 'selected']

  tplAttrs: ->  _.clone @attributes

class Phonebook.Collections.PeopleCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Person
  url: -> ds.apiHelper.urlFor 'people'
  initialize: ->
    @listenToOnce Backbone, 'people:bootstrap', ->
      ds.bootstrapper.bootstrap @
  mode: 'client'
  state:
    pageSize: 50
  #comparator: 'first_name'
