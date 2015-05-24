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
      namespace: 'engagements'
      searchAttrs: ['kind', 'name']
    @views.index.show()
    Backbone.trigger 'engagements:bootstrap'

  show: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.show?.remove()
      @views.show = new Phonebook.Views.Engagements.DetailView
        model: engagement
        container: @$el
        namespace: 'engagements'
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

  upload: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.upload?.remove()
      @views.upload = new Phonebook.Views.Engagements.UploadView
        model: engagement
        container: @$el
      @views.upload.show(animation)
    @getModelById(id)

  attendance: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (engagement) =>
      @views.attendance?.remove()
      @views.attendance = new Phonebook.Views.People.SelectorView
        model: engagement
        association: 'attendees'
      @views.attendance.show(animation)
    @getModelById(id)


  # methods below are NOT called by router, like private methods in a rails controller
  activate: ->
    return if @active
    Backbone.trigger "engagements:index"
    @$el.addClass('active')
    @active = true

  deactivate: ->
    @active = false
    @$el.removeClass('active')
    for k,v of @views
      v.remove() unless v == @views.index

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
    @collection.trigger 'reset'

  duplicate: (model) ->
      data = _.omit(_.clone(model.attributes), 'id', 'date')
      engagement = new Phonebook.Models.Engagement
        selected: true
      engagement.save data,
        success: (model) ->
          Backbone.trigger 'engagements:saved', model
          Backbone.trigger 'engagements:show', model, 'fade-in'
        error: (e) ->
          console.log errror

