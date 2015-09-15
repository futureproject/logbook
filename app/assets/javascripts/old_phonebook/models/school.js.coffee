class Phonebook.Models.School extends Backbone.Model
  getName: ->
    @get('name') || 'Unnamed School'

class Phonebook.Collections.SchoolsCollection extends Backbone.Collection
  model: Phonebook.Models.School
  url: ds.apiHelper.urlFor 'schools'
