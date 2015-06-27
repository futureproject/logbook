window.ds ||= {}

ds.run = (args) ->
  ds.views = {}
  ds.views.nav_toggle = new ds.ScopeToggleView({ el: "#scope-nav" })
