class Phonebook.Models.Person extends Backbone.Model
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

  toJSON: ->
    _.omit _.clone(@attributes), ['attending']

  tplAttrs: ->  _.clone @attributes

class Phonebook.Collections.PeopleCollection extends Backbone.Collection
  model: Phonebook.Models.Person
  url: -> ds.apiHelper.urlFor 'people', Phonebook.USER.site.id
