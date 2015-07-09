class ds.DashboardController
  constructor: ->
    _.extend @, Backbone.Events
    @listenTo Backbone, 'dashboard:show', @show
    @listenTo Backbone.trigger 'controller:active', => @view?.remove()

  show: ->
    Backbone.trigger 'controller:active'
    scope = ds.scopeHelper.getScope()
    @view = switch scope.get('namespace')
      when "sites" then new ds.SitesDashboardView({ model: scope })
      when "schools" then new ds.SchoolsDashboardView({ model: scope })
      else new ds.NationalDashboardView({ model: scope })
    @view.setElement('#yield')
    @view.render()

