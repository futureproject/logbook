class ds.PeopleController extends ds.BaseController
  el: "#people-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "people:index", @index
    @listenTo Backbone, "people:show", @show
    @listenTo Backbone, "people:new", @new
    @listenTo Backbone, "people:edit", @edit

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

  new: (person) ->
    person = new ds.Person
    @views.new = new ds.PeopleNewView
      model: person
    @views.new.renderTo @targetEl

  edit: (id) ->
    person = @setPersonFromId(id)
    @views.edit = new ds.PeopleEditView
      model: person
    @views.edit.renderTo @targetEl

  setPersonFromId: (id) ->
    @activate()
    # if this is an actual id, not a cid
    if parseInt(id)
      person = ds.collections.people.get(id) || new ds.Person({ id: id })
      person.fetch()
    else
      person = ds.collections.people.get({cid: id}) || new ds.Person({ cid: id })
    person
