window.ds ||= {}
ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.run = (args) ->
  $.ajaxPrefilter (options, originalOptions, jqXHR) =>
    jqXHR.withCredentials = true
    console.log "AJAX call to #{options.url}"

  ds.current_user = new ds.User(ds.CONSTANTS.current_user)
  ds.collections.sites = new ds.SitesCollection
  ds.collections.schools = new ds.SchoolsCollection
  ds.views.scope_toggle = new ds.ScopeToggleView
  ds.views.scope_menu = new ds.ScopeMenuView
  ds.views.user_view = new ds.UserView
  ds.controllers.dashboard = new ds.DashboardController
  ds.controllers.people = new ds.PeopleController
  ds.controllers.engagements = new ds.EngagementsController
  ds.controllers.projects = new ds.ProjectsController
  ds.controllers.reports = new ds.ReportsController
  ds.controllers.graphs = new ds.GraphsController
  ds.router = new ds.Router
  ds.scopeHelper.setScope(ds.CONSTANTS.scope)
  Backbone.history.start({ pushState: true })