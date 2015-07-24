class ds.ReportsController extends ds.BaseController
  el: "#reports-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "reports:index", @index

  index: ->
    @activate()
    $(@targetEl).empty().html "<h1>Reports</h1>"

