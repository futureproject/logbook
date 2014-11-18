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
    ds.bootstrapper.load @collection
    #@collection.reset(args?.data,
    #  success: =>
    #    @collection.fetch
    #      remote: true
    #)

  template: JST['phonebook/templates/engagements/controller']

  render: ->
    @$el.html @template()
    @views.list.setElement '#engagements-list-items'
    @views.show.setElement '#show-engagement'

  listen: ->
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show

  index: ->
    @views.list.el.classList.add('active')
    @collection.each (model) -> model.unset 'selected'

  show: (id) ->
    model = @collection.get(id)?.set('selected', true)
    Backbone.trigger('engagements:selected', model) if model
