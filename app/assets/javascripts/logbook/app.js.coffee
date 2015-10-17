window.ds ||= {}
ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.run = (args) ->
  ds.current_user = new ds.User(ds.CONSTANTS.current_user)
  ds.collections.sites = new ds.SitesCollection
  ds.collections.schools = new ds.SchoolsCollection
  ds.collections.people = new ds.PeopleCollection
  ds.collections.projects = new ds.ProjectsCollection
  ds.collections.engagements = new ds.EngagementsCollection
  ds.collections.report_submissions = new ds.ReportSubmissionsCollection
  ds.views.app_view = new ds.AppView
  ds.views.scope_toggle = new ds.ScopeToggleView
  ds.views.scope_menu = new ds.ScopeMenuView
  ds.views.user_view = new ds.UserView
  ds.views.global_add_trigger = new ds.GlobalAddTriggerView
  ds.views.quick_search = new ds.QuickSearchView
  ds.controllers.dashboard = new ds.DashboardController
  ds.controllers.people = new ds.PeopleController
  ds.controllers.engagements = new ds.EngagementsController
  ds.controllers.projects = new ds.ProjectsController
  ds.controllers.report_submissions = new ds.ReportSubmissionsController
  ds.controllers.hashtags = new ds.HashtagsController
  ds.controllers.notes = new ds.NotesController
  ds.router = new ds.Router
  ds.scopeHelper.setScope(ds.CONSTANTS.scope)
  Backbone.history.start({ pushState: true })
