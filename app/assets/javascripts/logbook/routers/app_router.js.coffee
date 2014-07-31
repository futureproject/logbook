class dream.Routers.AppRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'router:go', @go

  go: (route, args) ->
    @navigate route

  routes:
    # people
    'logbook/people': 'people_index'
    'logbook/people/new' : 'people_new'
    'logbook/people/:id/edit' : 'people_edit'
    'logbook/people/:id' : 'people_show'

    # projects
    'logbook/projects': 'projects_index'
    'logbook/projects/new' : 'projects_new'
    'logbook/projects/:id/edit' : 'projects_edit'
    'logbook/projects/:id' : 'projects_show'

    # tasks
    'logbook/task_assignments': 'task_assignments_index'
    'logbook/task_assignments/new' : 'task_assignments_new'
    'logbook/task_assignments/:id/edit' : 'task_assignments_edit'
    'logbook/task_assignments/:id' : 'task_assignments_show'

    # workshops
    'logbook/workshops': 'workshops_index'
    'logbook/workshops/new' : 'workshops_new'
    'logbook/workshops/:id/edit' : 'workshops_edit'
    'logbook/workshops/:id' : 'workshops_show'

###### PEOPLE
  people_index: ->
    Backbone.trigger 'people:present', 'index'

  people_new: ->
    Backbone.trigger 'people:present', 'new'

  people_edit: (id) ->
    Backbone.trigger 'people:present', 'edit'

  people_show: (id) ->
    Backbone.trigger 'people:present', 'index'
    Backbone.trigger 'people:present', 'show'

###### PROJECTS
  projects_index: ->
    Backbone.trigger 'projects:present', 'index'

  projects_new: ->
    Backbone.trigger 'projects:present', 'new'

  projects_edit: (id) ->
    Backbone.trigger 'projects:present', 'edit'

  projects_show: (id) ->
    Backbone.trigger 'projects:present', 'edit'


###### TASKS
  projects_index: ->
  task_assignments_index: ->
    Backbone.trigger 'tasks:present', 'index'

  task_assignments_new: ->
    Backbone.trigger 'tasks:present', 'new'

  task_assignments_edit: (id) ->
    Backbone.trigger 'tasks:present', 'edit'

  task_assignments_show: (id) ->
    Backbone.trigger 'tasks:present', 'edit'


######### WORKSHOPS
  workshops_index: ->
    Backbone.trigger 'workshops:present', 'index'

  workshops_new: ->
    Backbone.trigger 'workshops:present', 'new'

  workshops_edit: (id) ->
    Backbone.trigger 'workshops:present', 'edit'

  workshops_show: (id) ->
    Backbone.trigger 'workshops:present', 'edit'
