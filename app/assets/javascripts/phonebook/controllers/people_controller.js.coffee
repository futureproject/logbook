class ds.PeopleController extends Backbone.View
  el: "#phonebook-people"
  initialize: ->
    @render()
    @views = {}
    @collection = new ds.PeopleCollection
    @listenTo Backbone, "people:do", @do

  template: _.template "
    <div id='phonebook-people-index' class='index'></div>
    <div id='phonebook-people-show'></div>
  "
  render: ->
    @$el.html @template()

  do: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  index: ->
    ds.router.navigate "phonebook/people"
    @views.index = new ds.PeopleIndexView
      collection: @collection
    @views.index.renderTo("#phonebook-people-index")

  show: (id) ->
    ds.router.navigate "phonebook/people/#{id}"
    person = @getModelFromId(id)
    @views.show = new ds.PeopleShowView
      model: person
    @views.show.renderTo "#phonebook-people-show"

  getModelFromId: (id) ->
    # if this is an actual id, not a cid
    collection = @collection.fullCollection || @collection
    if parseInt(id)
      person = collection.get(id) || new ds.Person({ id: id })
      person.fetch()
    else
      person = collection.get({cid: id}) || new ds.Person({ cid: id })
    person
