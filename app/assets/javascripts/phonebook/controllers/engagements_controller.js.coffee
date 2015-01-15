class Phonebook.Controllers.EngagementsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.EngagementsCollection
    @listen()
    @router = new Phonebook.Routers.EngagementsRouter
    @views = {}
    #@views =
    #  index: new Phonebook.Views.Engagements.IndexView
    #    collection: @collection
    #  show: new Phonebook.Views.Engagements.ShowView
    #  new: new Phonebook.Views.Engagements.NewView
    #  edit: new Phonebook.Views.Engagements.EditView
    #  upload: new Phonebook.Views.Engagements.UploadView
    #  attendance: new Phonebook.Views.Engagements.AttendanceView



  listen: ->
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show
    @listenTo Backbone, 'engagements:new', @new
    @listenTo Backbone, 'engagements:edit', @edit
    @listenTo Backbone, 'engagements:upload', @upload
    @listenTo Backbone, 'engagements:attendance', @attendance
    @listenTo Backbone, 'engagements:saved', @onSave
    @listenTo Backbone, 'engagements:duplicate', @duplicate
    #@listenTo Backbone, 'engagements:views:shown', @onShow
    #@listenTo Backbone, 'engagements:views:hidden', @onHide

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

  duplicate: (model) ->
      data = _.omit(model.attributes, 'id', 'date')
      engagement = new Phonebook.Models.Engagement
      engagement.save data,
        success: (model) ->
          Backbone.trigger 'engagements:saved', model
        error: (e) ->
          console.log errror


  # THERE BE ROUTER ACTIONS BELOW

  index: ->
    _.each @views, (view) -> view.hide()
    @views.index ||= new Phonebook.Views.Engagements.IndexView
      container: @$el
      collection: @collection
    @views.index.show()
    Backbone.trigger 'engagements:bootstrap'

  show: (id) ->
    engagement = @collection.get(id) || new Phonebook.Models.Engagement({ id: id })
    @views.show = new Phonebook.Views.Engagements.ShowView
      model: engagement
      container: @$el
    @views.show.show()

  new: (e) ->
    @views.new = new Phonebook.Views.Engagements.NewView
      container: @$el
    @views.new.show()

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
