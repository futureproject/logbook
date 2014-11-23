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
      edit: new Phonebook.Views.Engagements.EditView

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
    @views.edit.setElement '#edit-engagement'

  listen: ->
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show
    @listenTo Backbone, 'engagements:edit', @edit
    @listenTo Backbone, 'engagements:saved', @onSave
    @listenTo Backbone, 'engagements:views:shown', @onShow
    @listenTo Backbone, 'engagements:views:hidden', @onHide

  onShow: (view) ->
    if view == @views.show
      @views.list.$el.addClass('shifted')

  onHide: (view) ->
    @views.list.el.classList.add 'active'
    Backbone.trigger 'engagements:router:update', ''
    if view == @views.show
      @views.list.$el.removeClass('shifted')

  onSave: (model) ->
    @collection.add model,
      merge: true
    Backbone.trigger 'engagements:show', model.get('id')

  # THERE BE ROUTER ACTIONS BELOW

  index: ->
    _.each @views, (view) -> view.hide()
    @views.list.show()

  show: (id) ->
    model = @collection.get(id)
    Backbone.trigger('engagements:selected', model) if model

  new: (e) ->
    Backbone.trigger 'engagements:new', e

  edit: (id) ->
    console.log 'editing...'
    model = @collection.get(id)
    Backbone.trigger('engagements:editing', model) if model
