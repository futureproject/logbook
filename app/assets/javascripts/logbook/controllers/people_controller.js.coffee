class ds.PeopleController extends ds.BaseController
  rootURL: "logbook/people"
  el: "#people-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "people:index", @index

  index: ->
    ds.collectionHelper.bootstrap ds.collections.people
    @activate()
    @views.index = new ds.PeopleIndexView
    @views.index.renderTo @targetEl

