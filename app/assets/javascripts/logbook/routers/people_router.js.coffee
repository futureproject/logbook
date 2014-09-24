class dream.Routers.PeopleRouter extends Backbone.Router
  initialize: (args) ->
    @presenter = args.presenter
    @listenTo Backbone, 'router:update', @updateRoute
    @listenTo Backbone, 'people:link', @link

  updateRoute: (route) -> @navigate(route)

  routes:
    'logbook/people': 'index'
    'logbook/people/new' : 'new'
    'logbook/people/:id/edit' : 'edit'
    'logbook/people/:id' : 'show'

  index: ->
    Backbone.trigger 'people:present'

  new: ->
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      Backbone.trigger 'person:new', @presenter.collection
    Backbone.trigger 'people:present'

  edit: (id) ->
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'person:show', model
      Backbone.trigger 'person:edit', model
    Backbone.trigger 'people:present'

  show: (id) ->
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'person:show', model
    Backbone.trigger 'people:present'

  link: (url) ->
    @navigate url, { trigger: true }
