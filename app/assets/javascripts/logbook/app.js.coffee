window.ds ||= {}
ds.views = {}
ds.models = {}
ds.collections ={}

ds.run = (args) ->
  ds.collections.sites = new ds.SitesCollection
  ds.views.nav_toggle = new ds.ScopeToggleView({ el: "#scope-nav", collection: ds.CONSTANTS.sites })
  ds.collections.sites.reset ds.CONSTANTS.sites
