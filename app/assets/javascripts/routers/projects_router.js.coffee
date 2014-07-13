class dream.Routers.ProjectsRouter extends Backbone.Router

  routes:
    'projects': 'index'
    'projects/new' : 'new'
    'projects/:id/edit' : 'edit'
    'projects/:id' : 'show'

  index: ->
    Backbone.trigger 'projects:present', 'index'

  new: ->
    Backbone.trigger 'projects:present', 'new'

  edit: (id) ->
    Backbone.trigger 'projects:present', 'edit'

  show: (id) ->
    Backbone.trigger 'projects:present', 'edit'
