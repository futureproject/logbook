class ds.DashboardController extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'dashboard:show', @show
    @listenTo Backbone, 'controller:active', @cleanup

  events:
    'click': 'show'

  cleanup: (controller) ->
    if controller == @
      @$el.addClass('active')
      @active = true
    else
      @$el.removeClass('active')
      @view?.hide()
      @active = false

  show: (event) ->
    event?.preventDefault()
    return if @active
    Backbone.trigger 'controller:active', @
    scope = ds.scopeHelper.getScope()
    @view = switch scope.get('namespace')
      when "sites" then new ds.SitesDashboardView({ model: scope })
      when "schools" then new ds.SchoolsDashboardView({ model: scope })
      else new ds.NationalDashboardView({ model: scope })
    @view.setElement('#yield')
    @view.render()

  el: '#dashboard-nav-item'
