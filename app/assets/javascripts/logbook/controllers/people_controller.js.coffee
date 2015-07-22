class ds.PeopleController extends ds.BaseController
  rootURL: "logbook/people"
  el: "#people-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "people:index", @index
    @listenTo Backbone, 'people:show', @show

  index: ->
    ds.collectionHelper.bootstrap ds.collections.people
    @activate()
    @views.index = new ds.PeopleIndexView
    @views.index.renderTo @targetEl

  show: (id) ->
    person = @setPersonFromId(id)
    @views.show = new ds.PeopleShowView
      model: person
    @views.show.renderTo @targetEl

  setPersonFromId: (id) ->
    @activate()
    person = ds.collections.people.get(id) || new ds.Person({id: id})
    person.fetch()
    person
