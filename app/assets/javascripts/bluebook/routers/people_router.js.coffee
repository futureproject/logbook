class Bluebook.Routers.PeopleRouter extends Backbone.Router
  routes:
    'bluebook' : 'index'
    'bluebook/' : 'index'

  index: ->
    Backbone.trigger 'people:index'
