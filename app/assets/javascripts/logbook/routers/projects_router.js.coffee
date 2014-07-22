class dream.Routers.ProjectsRouter extends Backbone.Router

  routes:
    'logbook/projects': 'index'
    'logbook/projects/new' : 'new'
    'logbook/projects/:id/edit' : 'edit'
    'logbook/projects/:id' : 'show'

  index: ->
    Backbone.trigger 'projects:present', 'index'

  new: ->
    Backbone.trigger 'projects:present', 'new'

  edit: (id) ->
    Backbone.trigger 'projects:present', 'edit'

  show: (id) ->
    Backbone.trigger 'projects:present', 'edit'
