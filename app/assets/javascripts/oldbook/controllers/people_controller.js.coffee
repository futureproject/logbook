class Phonebook.Controllers.PeopleController extends Backbone.View
  initialize: (args) ->
    Phonebook.collections.people ||= new Phonebook.Collections.PeopleCollection
    @collection = Phonebook.collections.people
    @router = new Phonebook.Routers.PeopleRouter
    @views = {}
    @listenToOnce Backbone, "people:bootstrap", -> ds.bootstrapper.bootstrap @collection
    @listenTo Backbone, 'people:index', @index
    @listenTo Backbone, 'people:show', @show
    @listenTo Backbone, 'people:new', @new
    @listenTo Backbone, 'people:edit', @edit
    @listenTo Backbone, 'people:saved', @onSave

  index: ->
    _.each @views, (view) -> view.hide()
    @views.index ||= new Phonebook.Views.People.IndexView
      container: @$el
      collection: @collection
      namespace: 'people'
      searchAttrs: ['first_name', 'last_name', 'createable']
    @views.index.show()
    Backbone.trigger 'people:bootstrap'

  show: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (person) =>
      @views.show?.remove()
      @views.show = new Phonebook.Views.People.DetailView
        model: person
        container: @$el
        namespace: 'people'
      @views.show.show(animation)
    @getModelById(id)

  new: (animation) ->
    @views.new?.remove()
    @views.new = new Phonebook.Views.People.NewView
      container: @$el
    @views.new.show(animation)

  edit: (id, animation) ->
    @listenToOnce Backbone, 'model:loaded', (person) =>
      @views.edit?.remove()
      @views.edit = new Phonebook.Views.People.EditView
        model: person
        container: @$el
      @views.edit.show(animation)
    @getModelById(id)


  # methods below are NOT called by router, like private methods in a rails controller
  activate: ->
    return if @active
    Backbone.trigger "people:index"
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
      model = new Phonebook.Models.Person
        id: id
      model.fetch
        success: -> Backbone.trigger 'model:loaded', model

  onSave: (model) ->
    @collection.add model,
      merge: true
    @collection.trigger 'reset'

