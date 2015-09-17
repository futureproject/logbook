class ds.Person extends Backbone.Model
  initialize: ->
    @collections =
      engagements: new ds.EngagementsForPersonCollection @get('engagements'),
        source: @
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

  tplAttrs: -> {person: _.extend _.clone(@attributes), engagements_count: @collections.engagements.length}

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
    @listenTo Backbone, "#{@namespace}:sync", =>
      @trigger "sync:started"
      localStorage.removeItem @url()
      @fetch
        reset: true,
        remote: true
        complete: => @trigger("sync:ended")

