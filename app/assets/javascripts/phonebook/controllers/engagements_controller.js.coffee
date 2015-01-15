class Phonebook.Controllers.EngagementsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.EngagementsCollection
    @listen()
    @router = new Phonebook.Routers.EngagementsRouter
    @views =
      index: new Phonebook.Views.Engagements.IndexView
        collection: @collection
      show: new Phonebook.Views.Engagements.ShowView
      new: new Phonebook.Views.Engagements.NewView
      edit: new Phonebook.Views.Engagements.EditView
      upload: new Phonebook.Views.Engagements.UploadView
      attendance: new Phonebook.Views.Engagements.AttendanceView

    @render()

  template: JST['phonebook/templates/engagements/controller']

  render: ->
    @$el.html @template()
    @views.index.setElement '#engagements-list'
    @views.show.setElement '#show-engagement'
    @views.new.setElement '#new-engagement'
    @views.edit.setElement '#edit-engagement'
    @views.upload.setElement '#engagement-uploads'
    @views.attendance.setElement '#engagement-attendance'

  listen: ->
    @listenTo Backbone, 'network:true', -> ds.bootstrapper.loadRemote(@collection)
    @listenTo Backbone, 'network:false', -> ds.bootstrapper.loadLocal(@collection)
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
      @views.index.$el.addClass('shifted')

  onHide: (view) ->
    @views.index.el.classList.add 'active'
    if view == @views.new || view == @views.show
      Backbone.trigger 'engagements:router:update', ''
    else if view.model
      Backbone.trigger 'engagements:router:update', view.model.get('id')
    if view == @views.show
      @views.index.$el.removeClass('shifted')

  onSave: (model) ->
    @collection.add model,
      merge: true
    Backbone.trigger 'engagements:show', model.get('id')

  # THERE BE ROUTER ACTIONS BELOW

  index: ->
    _.each @views, (view) -> view.hide()
    @views.index.show()

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
