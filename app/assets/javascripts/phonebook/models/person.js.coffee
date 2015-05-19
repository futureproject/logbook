class Phonebook.Models.Person extends Backbone.Model
  className: 'Person'
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Phonebook.user.get('school_id')
    school_name: ''
    grade: null
    dream_team: false
    attending: null
    notes: null
    email: null
    phone: null

# Backbone.DualStorage saves selected state, so ignore it
  parse: (response) -> _.omit response, ['selected']

  #toJSON: ->
    #_.omit _.clone(@attributes), ['attending', 'selected']

  tplAttrs: ->  _.clone @attributes

class Phonebook.Collections.PeopleCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: ->
    @listenToOnce Backbone, "#{@namespace}:bootstrap", ->
      ds.bootstrapper.bootstrap @
    @listenTo Backbone, "#{@namespace}:fetch", ->
      ds.bootstrapper.bootstrap @

  mode: 'client'
  state:
    pageSize: 50
  #comparator: 'first_name'
