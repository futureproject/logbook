class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    role: 'student'
    grade: null
    school_id: ds.CURRENT_USER.get('school_id')

  toJSON: ->
    _.omit _.clone(@attributes), ['engagements', 'projects', 'notes']

  tplAttrs: -> { person: @toJSON() }

  validate: (attrs, options) ->
    if !attrs.first_name
      "This person needs a first name."
    else if !attrs.last_name
      "This person needs a last name."

class ds.PeopleCollection extends Backbone.Collection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
