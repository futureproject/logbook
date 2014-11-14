class Phonebook.Models.Person extends Backbone.Model
  defaults: ->
    first_name: null
    last_name: null
    role: 'student'
    school_id: Phonebook.USER.school_id
    grade: 11
    core: true

class Phonebook.Collections.PeopleCollection extends Backbone.Collection
  model: Phonebook.Models.Person
  url: -> ds.apiHelper.urlFor 'people', Phonebook.USER.site.id
  remote: false
  comparator: 'first_name'
