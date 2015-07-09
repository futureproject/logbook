class ds.DashboardController extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'dashboard:show', @trigger

  trigger: ->
    @listenToOnce Backbone, 'current_scope:got', @show
    Backbone.trigger 'current_scope:get'

  show: (scope) ->
    @view ||= new ds.DashboardView
      model: scope
      el: "#yield"
    @view.render()

