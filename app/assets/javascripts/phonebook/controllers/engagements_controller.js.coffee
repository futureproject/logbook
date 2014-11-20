class Phonebook.Controllers.EngagementsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.EngagementsCollection
    @listen()
    @router = new Phonebook.Routers.EngagementsRouter
    @views =
      list: new Phonebook.Views.Engagements.ListView
        collection: @collection
      show: new Phonebook.Views.Engagements.ShowView
      new: new Phonebook.Views.Engagements.NewView

    @render()
    ds.bootstrapper.load @collection

  template: JST['phonebook/templates/engagements/controller']
  events:
    'tap .new': 'new'
    'touchmove .list-title': (e) -> e.preventDefault()

  render: ->
    @$el.html @template()
    @views.list.setElement '#engagements-list-items'
    @views.show.setElement '#show-engagement'
    @views.new.setElement '#new-engagement'

  listen: ->
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show
    @listenTo Backbone, 'engagements:views:hidden', @afterHide

  afterHide: (view) ->
    @views.list.el.classList.add 'active'

  index: ->
    @views.list.el.classList.add('active') #show the list
    @collection.each (model) -> model.unset 'selected' #deselect each listItem model (to hide)
    @views.new.model.unset 'selected' #deslect the New model (to hide the view)

  show: (id) ->
    model = @collection.get(id)?.set('selected', true)
    Backbone.trigger('engagements:selected', model) if model

  new: (e) ->
    Backbone.trigger 'engagements:new', e
