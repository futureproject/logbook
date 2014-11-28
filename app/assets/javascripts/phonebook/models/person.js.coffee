class Phonebook.Models.Person extends Backbone.Model
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Phonebook.user.get('school_id')
    grade: 11
    dream_team: false

  toJSON: ->
    _.omit _.clone(@attributes), ['attending']

class Phonebook.Collections.PeopleCollection extends Backbone.Collection
  model: Phonebook.Models.Person
  url: -> ds.apiHelper.urlFor 'people', Phonebook.USER.site.id
  comparator: 'first_name'
