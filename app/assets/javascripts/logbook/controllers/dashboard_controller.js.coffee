class ds.DashboardController extends ds.BaseController
  rootURL: "logbook"
  el: "#dashboard-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "dashboard:show", @show

  show: ->
    @activate()
    scope = ds.scopeHelper.getScope()
    @views.show = switch scope.get("namespace")
      when "sites" then new ds.SitesDashboardView({ model: scope })
      when "schools" then new ds.SchoolsDashboardView({ model: scope })
      else new ds.NationalDashboardView({ model: scope })
    @views.show.renderTo @targetEl

