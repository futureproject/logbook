class Bluebook.Routers.StatsRouter extends Backbone.Router
  initialize: (options) ->
    @listenTo Backbone, 'statsRouter:go', @go

  go: (route, useTrigger) ->
    if useTrigger?
      @navigate route, { trigger: true }
    else
      @navigate route

  routes:
    "bluebook"    : "index"
    "bluebook/" : "index"

  index: ->
    Backbone.trigger 'stats:index'


