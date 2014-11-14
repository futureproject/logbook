class Phonebook.Routers.EngagementsRouter extends Backbone.Router
  routes:
    'phonebook': 'index'
    'phonebook/': 'index'

  index: ->
    Backbone.trigger 'engagements:index'
