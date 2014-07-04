#= require jquery
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./presenters

window.Bluebook =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  presenters: {}
  initialize: (data) ->
# prevent scrolling
    $(document).on('touchmove', (e) ->
      e.preventDefault()
    )
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true
    @USER = data.current_user
    @presenters.stats = new Bluebook.StatsPresenter
      el: '#to_stats'
      targetEl: '#stats'
    @presenters.people = new Bluebook.PeoplePresenter
      el: '#to_people'
      targetEl: '#people'
    Backbone.trigger 'app:loaded'
    Backbone.history.start({ pushState: true })
