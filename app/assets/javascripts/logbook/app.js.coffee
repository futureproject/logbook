window.ds ||= {}
ds.views = {}
ds.models = {}
ds.collections ={}

ds.run = (args) ->
  ds.current_user = new ds.User(ds.CONSTANTS.current_user)
  ds.collectionHelper.listenTo Backbone, 'collection:init', ds.collectionHelper.bootstrap
  ds.collections.sites = new ds.SitesCollection
  ds.collections.schools = new ds.SchoolsCollection
  ds.views.scope_toggle = new ds.ScopeToggleView
  ds.views.scope_menu = new ds.ScopeMenuView
  ds.views.user_view = new ds.UserView
  ds.graphs_controller = new ds.GraphsController

