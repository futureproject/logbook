#= require jquery
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone-datalink
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Bluebook =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: (data) ->
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}"
    $.ajaxSetup
      timeout: 5000
    @USER = data.current_user
    @Routers.people = new Bluebook.Routers.PeopleRouter
      people: data.people
    Backbone.history.start({ pushState: true })
