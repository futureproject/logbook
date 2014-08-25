class dream.Models.Person extends Backbone.Model
  urlRoot: '/people'
  defaults: ->
    first_name: ''
    last_name: ''
    role: 'student'
    grade: '9'
    dream_team: true
    notes: ''
    school_id: dream.USER.school.id
    one_on_ones: []

  validate: (attrs) ->
    return 'Name me!' if !attrs.first_name? || !attrs.last_name?

  name: -> "#{@get('first_name')} #{@get('last_name')}"

  selectizeAttrs: ->
    {
      first_name: @get('first_name')
      last_name: @get('last_name')
      id: @get('id')
      dream_team: @get('dream_team')
      name: @name()
    }

class dream.Collections.People extends Backbone.Collection
  initialize: ->
    @bootstrap()
    @on 'reset', @broadcast
    @listenTo Backbone, 'network:online', @syncDirtyAndDestroyed
    @listenTo Backbone, 'person:created', @addModel
    @listenTo Backbone, 'people:fetchLocal', @fetchLocal
    @listenTo Backbone, 'people:bootstrap', @bootstrap
    @listenTo Backbone, 'people:getSome', @getSome

  model: dream.Models.Person

  url: '/people'

  comparator: (person) -> [-person.get('dream_team'), person.get('first_name')]

  broadcast: ->
    @sifter = new Sifter @models.map (model) -> model.selectizeAttrs()
    Backbone.trigger 'peopleCollection:changed', @

  # fetch new data from the server
  # broadcast models if there is new data
  refresh: (e) ->
    length = @length
    @fetch
      remote: true
      success: (collection, response, options) ->
        collection.syncDirtyAndDestroyed() if navigator.onLine
        collection.broadcast() if length != collection.length

  # add one model and broadcast
  addModel: (model) ->
    @add(model)
    @broadcast()

  # fetch this collection from localStorage
  fetchLocal: ->
    @fetch
      remote: false
      reset: true

  # get models into this collection
  # pull from localStorage first
  # if that comes up empty, pulls from network
  bootstrap: ->
    if @length > 0
      @broadcast()
    else
      @fetch
        remote: false
        success: =>
          if @length > 0
            @broadcast()
          else
            @fetch
              remote: true
              success: =>
                @broadcast()

  getSome: (params) ->
    return unless params?.ids?
    subset = []
    for id in params.ids
      model = @get(id)
      subset.push model if model?
    params.callback.call(@, subset) if params.callback?
    subset
