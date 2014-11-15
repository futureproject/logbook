class Phonebook.Routers.EngagementsRouter extends Backbone.Router
  initialize: ->
    @listenTo Backbone, 'engagements:router:update', @update

  routes:
    'phonebook/engagements/:id': 'show'
    'phonebook': 'index'
    'phonebook/': 'index'
    'phonebook/engagements/': 'index'

  index: ->
    Backbone.trigger 'engagements:index'

  show: (id) ->
    Backbone.trigger 'engagements:show', id

  update: (route) ->
    @navigate "phonebook/engagements/#{route}"
