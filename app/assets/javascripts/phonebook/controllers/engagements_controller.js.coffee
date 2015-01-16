class Phonebook.Controllers.EngagementsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.EngagementsCollection
    @router = new Phonebook.Routers.EngagementsRouter
    @views = {}
    @listenTo Backbone, 'engagements:index', @index
    @listenTo Backbone, 'engagements:show', @show
    @listenTo Backbone, 'engagements:new', @new
    @listenTo Backbone, 'engagements:edit', @edit
    @listenTo Backbone, 'engagements:upload', @upload
    @listenTo Backbone, 'engagements:attendance', @attendance
    @listenTo Backbone, 'engagements:saved', @onSave
    @listenTo Backbone, 'engagements:duplicate', @duplicate

  index: ->
    _.each @views, (view) -> view.hide()
    @views.index ||= new Phonebook.Views.Engagements.IndexView
      container: @$el
      collection: @collection
    @views.index.show()
    Backbone.trigger 'engagements:bootstrap'

  show: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.show?.remove()
      @views.show = new Phonebook.Views.Engagements.ShowView
        model: engagement
        container: @$el
      @views.show.show(animation)
    @getModelById(id)

  new: (animation) ->
    @views.new?.remove()
    @views.new = new Phonebook.Views.Engagements.NewView
      container: @$el
    @views.new.show(animation)

  edit: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.edit?.remove()
      @views.edit = new Phonebook.Views.Engagements.EditView
        model: engagement
        container: @$el
      @views.edit.show(animation)
    @getModelById(id)

  upload: (id) ->
    model = @collection.get(id)
    if model
      Backbone.trigger('engagements:selected', model)
      Backbone.trigger('engagements:uploading', model)

  attendance: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.attendance?.remove()
      @views.attendance = new Phonebook.Views.Engagements.AttendanceView
        model: engagement
        container: @$el
      @views.attendance.show(animation)
    @getModelById(id)

  # NOT CALLED BY ROUTER, ala 'private' in a rails controller

  getModelById: (id) ->
    if typeof(id) == "object"
      Backbone.trigger 'model:loaded', id
    else
      model = new Phonebook.Models.Engagement
        id: id
      model.fetch
        success: -> Backbone.trigger 'model:loaded', model

  onSave: (model) ->
    @collection.add model,
      merge: true
    Backbone.trigger 'engagements:show', model.get('id'), 'fade-in'

  duplicate: (model) ->
      data = _.omit(_.clone(model.attributes), 'id', 'date')
      engagement = new Phonebook.Models.Engagement
        selected: true
      engagement.save data,
        success: (model) ->
          Backbone.trigger 'engagements:saved', model
        error: (e) ->
          console.log errror


