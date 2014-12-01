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
      upload: new Phonebook.Views.Engagements.UploadView
      attendance: new Phonebook.Views.Engagements.AttendanceView

    @render()
    ds.bootstrapper.loadLocal @collection

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
    @views.upload.setElement '#engagement-uploads'
    @views.attendance.setElement '#engagement-attendance'

  listen: ->
    @listenTo Backbone, 'network:online', -> ds.bootstrapper.loadRemote(@collection)
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show
    @listenTo Backbone, 'engagements:edit', @edit
    @listenTo Backbone, 'engagements:upload', @upload
    @listenTo Backbone, 'engagements:attendance', @attendance
    @listenTo Backbone, 'engagements:saved', @onSave
    @listenTo Backbone, 'engagements:views:shown', @onShow
    @listenTo Backbone, 'engagements:views:hidden', @onHide

  onShow: (view) ->
    if view == @views.show
      @views.list.$el.addClass('shifted')

  onHide: (view) ->
    @views.list.el.classList.add 'active'
    if view == @views.new || view == @views.show
      Backbone.trigger 'engagements:router:update', ''
    else if view.model
      Backbone.trigger 'engagements:router:update', view.model.get('id')
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
    model = @collection.get(id)
    if model
      Backbone.trigger('engagements:selected', model)
      Backbone.trigger('engagements:editing', model)

  upload: (id) ->
    model = @collection.get(id)
    if model
      Backbone.trigger('engagements:selected', model)
      Backbone.trigger('engagements:uploading', model)

  attendance: (id) ->
    model = @collection.get(id)
    if model
      Backbone.trigger('engagements:selected', model)
      Backbone.trigger('engagements:taking_attendance', model)
