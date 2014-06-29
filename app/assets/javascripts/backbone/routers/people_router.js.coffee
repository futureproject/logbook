class Dreamos.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @people = new Dreamos.Collections.PeopleCollection()
    @people.reset options.people

  routes:
    "new"      : "newPerson"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPerson: ->
    @view = new Dreamos.Views.People.NewView(collection: @people)
    $("#people").html(@view.render().el)

  index: ->
    @view = new Dreamos.Views.People.IndexView(people: @people)
    $("#people").html(@view.render().el)

  show: (id) ->
    person = @people.get(id)

    @view = new Dreamos.Views.People.ShowView(model: person)
    $("#people").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    @view = new Dreamos.Views.People.EditView(model: person)
    $("#people").html(@view.render().el)
