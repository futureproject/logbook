class ds.PeopleController extends ds.BaseController
  rootURL: "logbook/people"
  el: "#people-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "people:index", @index

  index: ->
    @activate()
    $(@targetEl).empty().html "<h1>People</h1>"

