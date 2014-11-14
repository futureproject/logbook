class Phonebook.Routers.PeopleRouter extends Backbone.Router
  routes:
    'phonebook/people' : 'index'
    'phonebook/people/' : 'index'

  index: ->
    Backbone.trigger 'people:index'
