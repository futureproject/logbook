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

  tplAttrs: -> {person: _.clone(@attributes)}

  validate: (attrs, options) ->
    if !attrs.first_name
      "This person needs a first name."
    else if !attrs.last_name
      "This person needs a last name."

class ds.PeopleCollection extends Backbone.PageableCollection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
  mode: 'client'
  state: pageSize: 50
  initialize: ->
    @on "add", -> console.log "added"
    @on "remove", -> console.log "removed"
    @on "reset", => console.log "reset to #{@length}"

