class dream.Routers.WorkshopsRouter extends Backbone.Router

  routes:
    'logbook/workshops': 'index'
    'logbook/workshops/new' : 'new'
    'logbook/workshops/:id/edit' : 'edit'
    'logbook/workshops/:id' : 'show'

  index: ->
    Backbone.trigger 'workshops:present', 'index'

  new: ->
    Backbone.trigger 'workshops:present', 'new'

  edit: (id) ->
    Backbone.trigger 'workshops:present', 'edit'

  show: (id) ->
    Backbone.trigger 'workshops:present', 'edit'
