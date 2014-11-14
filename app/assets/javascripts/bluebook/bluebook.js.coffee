#= require jquery
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require fastclick
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
  views: {}
  initialize: (data) ->
    new FastClick document.body

    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true

    @USER = data.current_user


    @views.app = new Bluebook.Views.AppView(
      el: 'body'
    ).render()

    # instead of placing all views here,
    # views.people should be a master view, with everything else
    # people-related as a sub-view
    @views.people =
      index: new Bluebook.Views.People.IndexView
        el: '#phonebook-people'

    @routers =
      people: new Bluebook.Routers.PeopleRouter()

    Backbone.trigger 'app:loaded'
    Backbone.trigger 'network:online' if navigator.onLine
    Backbone.history.start({ pushState: true })
