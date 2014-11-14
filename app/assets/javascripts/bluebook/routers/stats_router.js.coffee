class Bluebook.Routers.StatsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "bluebook"    : "index"
    "bluebook/" : "index"

  index: ->
    Backbone.trigger 'stats:index'


