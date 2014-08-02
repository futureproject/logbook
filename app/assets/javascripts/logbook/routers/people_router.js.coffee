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
    Backbone.trigger 'people:present'

  new: ->
    Backbone.trigger 'people:present'

  edit: (id) ->
    Backbone.trigger 'people:present'

  show: (id) ->
    Backbone.trigger 'people:present'
    @presenter.collection.fetch
      complete: () =>
        @presenter.collection.select(@presenter.collection.get(id))

