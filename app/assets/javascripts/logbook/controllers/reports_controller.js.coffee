class ds.ReportsController extends ds.BaseController
  rootURL: "logbook/reports"
  el: "#weekly-reports-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "reports:index", @index

  index: ->
    @activate()
    $(@targetEl).empty().html "<h1>Reports</h1>"

