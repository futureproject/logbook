class Bluebook.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @listenTo Backbone, 'route:go', @go

    @views =
      new: new Bluebook.Views.People.NewView()
      index: new Bluebook.Views.People.IndexView(el: "#people .list-frame")
      show: new Bluebook.Views.People.ShowView(el: "#people .detail-frame")

    @people = new Bluebook.Collections.PeopleCollection()
    @people.reset options.people

  go: (route) ->
    @navigate route

  routes:
    "bluebook" : "index"
    "bluebook/" : "index"
    "bluebook/people/new"      : "newPerson"
    "bluebook/people/index"    : "index"
    "bluebook/people/:id/edit" : "edit"
    "bluebook/people/:id"      : "show"

  newPerson: ->
    #@view = new Bluebook.Views.People.NewView(collection: @people)
    #$("#people").html(@view.render().el)

  index: ->
    #@view = new Bluebook.Views.People.IndexView(people: @people, el: '#list')
    #@view.render()

  show: (id) ->
    person = @people.get(id)
    Backbone.trigger 'people:show', person
    Backbone.trigger 'people:getScrollPos', person

    #@view = new Bluebook.Views.People.ShowView(model: person)
    #$("#detail").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    #@view = new Bluebook.Views.People.EditView(model: person)
    #$("#detail").html(@view.render().el)
