class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    role: 'student'
    grade: null
    school_id: ds.user.current()?.get('school_id')
    projects: []
    engagements: []
    notes: []

  toJSON: ->
    _.omit _.clone(@attributes), ['engagements', 'projects', 'notes']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Person' })
    {person: attrs }

  validate: (attrs, options) ->
    if !attrs.first_name
      "This person needs a first name."
    else if !attrs.last_name
      "This person needs a last name."

class ds.PeopleCollection extends Backbone.Collection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
