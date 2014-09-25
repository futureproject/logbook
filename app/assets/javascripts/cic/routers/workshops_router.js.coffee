class dream.Routers.EngagementsRouter extends Backbone.Router

  routes:
    'logbook/engagements': 'index'
    'logbook/engagements/new' : 'new'
    'logbook/engagements/:id/edit' : 'edit'
    'logbook/engagements/:id' : 'show'

  index: ->
    Backbone.trigger 'engagements:present', 'index'

  new: ->
    Backbone.trigger 'engagements:present', 'new'

  edit: (id) ->
    Backbone.trigger 'engagements:present', 'edit'

  show: (id) ->
    Backbone.trigger 'engagements:present', 'edit'
