class dream.Routers.WorkshopsRouter extends Backbone.Router

  routes:
    'workshops': 'index'
    'workshops/new' : 'new'
    'workshops/:id/edit' : 'edit'
    'workshops/:id' : 'show'

  index: ->
    Backbone.trigger 'workshops:present', 'index'

  new: ->
    Backbone.trigger 'workshops:present', 'new'

  edit: (id) ->
    Backbone.trigger 'workshops:present', 'edit'

  show: (id) ->
    Backbone.trigger 'workshops:present', 'edit'
