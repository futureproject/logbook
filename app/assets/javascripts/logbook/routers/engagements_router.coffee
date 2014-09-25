class dream.Routers.EngagementsRouter extends Backbone.Router

  routes:
    'logbook/engagements': 'index'
    'logbook/engagements/new' : 'new'
    'logbook/engagements/:id/edit' : 'edit'
    'logbook/engagements/:id' : 'show'

  index: ->
    Backbone.trigger 'engagements:present'

  new: ->
    @listenToOnce Backbone, 'engagements:changed', (collection) =>
      Backbone.trigger 'engagement:new', collection
    Backbone.trigger 'engagements:present'

  edit: (id) ->
    @listenToOnce Backbone, 'engagements:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'engagement:show', model
      Backbone.trigger 'engagement:edit', model
    Backbone.trigger 'engagements:present'

  show: (id) ->
    @listenToOnce Backbone, 'engagements:changed', (collection) =>
      model = collection.get(id)
      Backbone.trigger 'engagement:show', model
    Backbone.trigger 'engagements:present'

