class dream.Routers.ProjectsRouter extends Backbone.Router

  routes:
    'logbook/projects': 'index'
    'logbook/projects/new' : 'new'
    'logbook/projects/:id/edit' : 'edit'
    'logbook/projects/:id' : 'show'

  index: ->
    Backbone.trigger 'projects:present'

  new: ->
    @listenToOnce Backbone, 'projectsCollection:changed', (collection) =>
      Backbone.trigger 'project:new', @presenter.collection
    Backbone.trigger 'projects:present'

  edit: (id) ->
    @listenToOnce Backbone, 'projectsCollection:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'project:show', model
      Backbone.trigger 'project:edit', model
    Backbone.trigger 'projects:present'

  show: (id) ->
    @listenToOnce Backbone, 'projectsCollection:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'project:show', model
    Backbone.trigger 'projects:present'

