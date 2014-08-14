class dream.Routers.StatsRouter extends Backbone.Router
  initialize: (args) ->
    @presenter = args.presenter
    @listenTo Backbone, 'router:update', @updateRoute

  updateRoute: (route) -> @navigate(route)

  routes:
    'logbook': 'index'
    'logbook/' : 'index'
    'logbook/stats' : 'index'

  index: ->
    Backbone.trigger 'stats:present'

