class Phonebook.Controllers.PeopleController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.PeopleCollection
    @listen()
    @collection.reset(args?.data)

  listen: ->
    @listenTo @collection, 'add', -> console.log 'added'
    @listenTo @collection, 'reset', -> console.log 'reset'

