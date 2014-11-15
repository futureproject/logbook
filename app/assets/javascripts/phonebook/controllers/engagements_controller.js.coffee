class Phonebook.Controllers.EngagementsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.EngagementsCollection
    @listen()
    @router = new Phonebook.Routers.EngagementsRouter
    @views =
      list: new Phonebook.Views.Engagements.ListView
        collection: @collection
      show: new Phonebook.Views.Engagements.ShowView

    @render()
    @collection.reset(args?.data)

  template: JST['phonebook/templates/engagements/controller']

  render: ->
    @$el.html @template()
    @views.list.setElement '#engagements-list-items'
    @views.show.setElement '#show-engagement'

  listen: ->
    @listenTo Backbone, 'engagements:index', @index

  index: ->
