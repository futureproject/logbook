class dream.Routers.PeopleRouter extends Backbone.Router
  initialize: (args) ->
    @presenter = args.presenter
    @listenTo Backbone, 'router:update', @updateRoute

  updateRoute: (route) -> @navigate(route)

  routes:
    'logbook/people': 'index'
    'logbook/people/new' : 'new'
    'logbook/people/:id/edit' : 'edit'
    'logbook/people/:id' : 'show'

  index: ->
    @presenter.collection.clearSelection()
    Backbone.trigger 'people:present'

  new: ->
    Backbone.trigger 'people:present'
    @presenter.collection.fetch
      complete: () =>
        Backbone.trigger 'person:new', @presenter.collection

  edit: (id) ->
    Backbone.trigger 'people:present'
    @presenter.collection.fetch
      complete: () =>
        model = @presenter.collection.get(id)
        @presenter.collection.select(model)
        Backbone.trigger 'person:edit', model

  show: (id) ->
    Backbone.trigger 'people:present'
    @presenter.collection.fetch
      complete: () =>
        model = @presenter.collection.get(id)
        @presenter.collection.select(model)

