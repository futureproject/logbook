class Bluebook.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @listenTo Backbone, 'peopleRouter:go', @go

    @people = new Bluebook.Collections.PeopleCollection()

  go: (route, args) ->
    if args?.trigger
      @navigate route, { trigger: true }
    else
      @navigate route

  loadAssociatedList: (person) ->
    if person.get('core')
      Backbone.trigger 'people:filter', null, null, { core: true }
    else
      Backbone.trigger 'people:filter', null, null, { role: person.get('role') }

  routes:
    "bluebook/people"    : "index"
    "bluebook/people/"    : "index"
    "bluebook/people/by_role/:filter" : 'byrole'
    "bluebook/people/new"      : "newPerson"
    "bluebook/people/:id/edit" : "edit"
    "bluebook/people/:id"      : "show"

  newPerson: ->
    #@view = new Bluebook.Views.People.NewView(collection: @people)
    #$("#people").html(@view.render().el)

  index: ->
    @people.fetch
      success: =>
        Backbone.trigger 'people:filter', null, null, { core: true }

  byrole: (role) ->
    @people.fetch
      reset: @people.length < 1
      success: =>
        Backbone.trigger 'people:filter', null, null, { role: role }

  show: (id) ->
    @people.fetch
      reset: @people.length < 1
      success: =>
        person = @people.get(id)
        @loadAssociatedList(person)
        Backbone.trigger 'people:show', person
        Backbone.trigger 'people:getScrollPos', person

    #@view = new Bluebook.Views.People.ShowView(model: person)
    #$("#detail").html(@view.render().el)

  edit: (id) ->
    @people.fetch
      reset: @people.length < 1
      success: =>
        person = @people.get(id)
        @loadAssociatedList(person)
        Backbone.trigger 'people:edit', person
        Backbone.trigger 'people:getScrollPos', person

    #@view = new Bluebook.Views.People.EditView(model: person)
    #$("#detail").html(@view.render().el)
