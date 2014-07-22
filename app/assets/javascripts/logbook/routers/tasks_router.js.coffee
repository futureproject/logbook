class dream.Routers.TasksRouter extends Backbone.Router

  routes:
    'logbook/tasks': 'index'
    'logbook/tasks/new' : 'new'
    'logbook/tasks/:id/edit' : 'edit'
    'logbook/tasks/:id' : 'show'

  index: ->
    Backbone.trigger 'tasks:present', 'index'

  new: ->
    Backbone.trigger 'tasks:present', 'new'

  edit: (id) ->
    Backbone.trigger 'tasks:present', 'edit'

  show: (id) ->
    Backbone.trigger 'tasks:present', 'edit'
