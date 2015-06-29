window.ds ||= {}
ds.views = {}
ds.models = {}
ds.collections ={}

ds.run = (args) ->
  ds.collections.sites = new ds.SitesCollection
  ds.collections.schools = new ds.SchoolsCollection
  ds.views.scope_toggle = new ds.ScopeToggleView({ el: "#scope-toggle", collection: ds.CONSTANTS.sites })
  ds.views.scope_menu = new ds.ScopeMenuView({ el: "#scope-menu", collection: ds.CONSTANTS.sites })
  ds.views.user_view = new ds.UserView({ el: "#user", user: ds.CONSTANTS.user })
  ds.collections.sites.reset ds.CONSTANTS.sites
  ds.collections.schools.reset ds.CONSTANTS.schools
