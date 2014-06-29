class Dreamos.Models.Person extends Backbone.Model
  paramRoot: 'person'

  defaults:
    first_name: null
    last_name: null
    role: null
    school_id: null
    grade: null
    core: null

class Dreamos.Collections.PeopleCollection extends Backbone.Collection
  model: Dreamos.Models.Person
  url: '/people'
