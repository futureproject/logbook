class ds.EngagementsController extends ds.BaseController
  rootURL: "logbook/engagements"
  el: "#engagements-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "engagements:index", @index

  index: ->
    @activate()
    $(@targetEl).empty().html "<h1>Engagements</h1>"

