class Bluebook.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @views =
      new: new Bluebook.Views.People.NewView()
      index: new Bluebook.Views.People.IndexView(el: "#list")
      show: new Bluebook.Views.People.ShowView(el: "#detail")
    @people = new Bluebook.Collections.PeopleCollection()
    @people.reset options.people

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
    console.log "router showing #{person.get('first_name')}"
    Bluebook.vent.trigger 'people:show', person

    #@view = new Bluebook.Views.People.ShowView(model: person)
    #$("#detail").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    #@view = new Bluebook.Views.People.EditView(model: person)
    #$("#detail").html(@view.render().el)
