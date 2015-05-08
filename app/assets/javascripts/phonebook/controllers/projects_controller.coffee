class Phonebook.Controllers.ProjectsController extends Backbone.View
  initialize: (args) ->
    @collection = new Phonebook.Collections.ProjectsCollection
    @router = new Phonebook.Routers.ProjectsRouter
    @views = {}
    @listenTo Backbone, 'projects:index', @index
    @listenTo Backbone, 'projects:show', @show
    @listenTo Backbone, 'projects:new', @new
    @listenTo Backbone, 'projects:edit', @edit
    @listenTo Backbone, 'projects:saved', @onSave

  index: ->
    _.each @views, (view) -> view.hide()
    @views.index ||= new Phonebook.Views.Projects.IndexView
      container: @$el
      collection: @collection
      namespace: 'projects'
    @views.index.show()
    Backbone.trigger 'projects:bootstrap'

  show: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (project) =>
      @views.show?.remove()
      @views.show = new Phonebook.Views.Projects.DetailView
        model: project
        container: @$el
        namespace: 'projects'
      @views.show.show(animation)
    @getModelById(id)

  new: (animation) ->
    @views.new?.remove()
    @views.new = new Phonebook.Views.Projects.NewView
      container: @$el
    @views.new.show(animation)

  edit: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (project) =>
      @views.edit?.remove()
      @views.edit = new Phonebook.Views.Projects.EditView
        model: project
        container: @$el
      @views.edit.show(animation)
    @getModelById(id)


  # methods below are NOT called by router, like private methods in a rails controller
  activate: ->
    return if @active
    Backbone.trigger "projects:index"
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
      model = new Phonebook.Models.Project
        id: id
      model.fetch
        success: -> Backbone.trigger 'model:loaded', model

  onSave: (model) ->
    @collection.add model,
      merge: true

