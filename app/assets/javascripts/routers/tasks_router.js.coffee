class dream.Routers.TasksRouter extends Backbone.Router

  routes:
    'tasks': 'index'
    'tasks/new' : 'new'
    'tasks/:id/edit' : 'edit'
    'tasks/:id' : 'show'

  index: ->
    Backbone.trigger 'tasks:present', 'index'

  new: ->
    Backbone.trigger 'tasks:present', 'new'

  edit: (id) ->
    Backbone.trigger 'tasks:present', 'edit'

  show: (id) ->
    Backbone.trigger 'tasks:present', 'edit'
