class dream.Routers.WorkshopsRouter extends Backbone.Router

  routes:
    'logbook/workshops': 'index'
    'logbook/workshops/new' : 'new'
    'logbook/workshops/:id/edit' : 'edit'
    'logbook/workshops/:id' : 'show'

  index: ->
    Backbone.trigger 'workshops:present'

  new: ->
    @listenToOnce Backbone, 'workshops:changed', (collection) =>
      Backbone.trigger 'workshop:new', collection
    Backbone.trigger 'workshops:present'

  edit: (id) ->
    @listenToOnce Backbone, 'workshops:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'workshop:show', model
      Backbone.trigger 'workshop:edit', model
    Backbone.trigger 'workshops:present'

  show: (id) ->
    @listenToOnce Backbone, 'workshops:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'workshop:show', model
    Backbone.trigger 'workshops:present'

