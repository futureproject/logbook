class dream.Routers.TasksRouter extends Backbone.Router

  routes:
    'cic/tasks': 'index'
    'cic/tasks/new' : 'new'
    'cic/tasks/:id/edit' : 'edit'
    'cic/tasks/:id' : 'show'

  index: ->
    Backbone.trigger 'tasks:present', 'index'

  new: ->
    Backbone.trigger 'tasks:present', 'new'

  edit: (id) ->
    Backbone.trigger 'tasks:present', 'edit'

  show: (id) ->
    Backbone.trigger 'tasks:present', 'edit'
