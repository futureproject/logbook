class Bluebook.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @listenTo Backbone, 'route:go', @go

    @views =
      new: new Bluebook.Views.People.NewView()
      index: new Bluebook.Views.People.IndexView(el: "#people .list-frame")
      show: new Bluebook.Views.People.ShowView(el: "#people .detail-frame")
      edit: new Bluebook.Views.People.EditView(el: "#people .detail-frame")

    @people = new Bluebook.Collections.PeopleCollection()

  go: (route) ->
    @navigate route

  routes:
    "bluebook/people/"    : "index"
    "bluebook/people/by_role/:filter" : 'filteredIndex'
    "bluebook/people/new"      : "newPerson"
    "bluebook/people/:id/edit" : "edit"
    "bluebook/people/:id"      : "show"

  newPerson: ->
    #@view = new Bluebook.Views.People.NewView(collection: @people)
    #$("#people").html(@view.render().el)

  index: ->
    @people.fetch
      reset: @people.length < 1
      success: =>
        Backbone.trigger 'people:filter', { core: true }

  filteredIndex: (filter) ->
    console.log filter
    @people.fetch
      reset: @people.length < 1
      success: =>
        Backbone.trigger 'people:filter', { role: filter }

  show: (id) ->
    @people.fetch
      reset: @people.length < 1
      success: =>
        person = @people.get(id)
        Backbone.trigger 'people:show', person
        Backbone.trigger 'people:getScrollPos', person

    #@view = new Bluebook.Views.People.ShowView(model: person)
    #$("#detail").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    #@view = new Bluebook.Views.People.EditView(model: person)
    #$("#detail").html(@view.render().el)
