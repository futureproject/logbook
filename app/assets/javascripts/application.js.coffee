#= require jquery
#= require jquery_ujs
#= require underscore-min
#= require backbone-min
#= require backbone.syphon
#= require selectize
#= require fastclick
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./presenters

window.dream =
  Models: {}
  Views: {}
  Collections: {}
  Routers: {}
  initialize: (data) ->
    @USER = data.current_user
    @presenter = new dream.AppPresenter(@)
    Backbone.trigger 'app:loaded'
    Backbone.history.start({ pushState: true })
