class ds.Router extends Backbone.Router
  routes:
    'logbook': 'dashboard'
    'logbook/dashboard': 'dashboard'

  dashboard: ->
    Backbone.trigger 'dashboard:show'

