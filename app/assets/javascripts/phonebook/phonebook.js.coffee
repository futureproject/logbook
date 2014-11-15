#= require jquery
#= require underscore-min
#= require backbone-min
#= require hammer-min
#= require hammer-jquery
#= require backbone.dualstorage
#= require backbone.syphon
#= require jquery.animatecss
#= require_self
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers
#= require_tree ./routers
#= require_tree ./presenters

window.ds ||= {}

window.Phonebook =
  Models: {}
  Views: {}
  Controllers: {}
  Collections: {}
  Routers: {}
  initialize: (data) ->
    $(document).hammer()

    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      #options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true
      console.log options.url

    @USER = data.current_user

    @controllers =
      app: new Phonebook.Controllers.AppController
        el: 'body'
      engagements: new Phonebook.Controllers.EngagementsController
        el: '#phonebook-engagements'
        data: data.engagements
      people: new Phonebook.Controllers.PeopleController
        data: data.people


    # instead of placing all views here,
    # views.people should be a master view, with everything else
    # people-related as a sub-view
    #@views.people =
    #  index: new Phonebook.Views.People.IndexView
    #    el: '#phonebook-people'

    Backbone.trigger 'app:loaded'
    Backbone.trigger 'network:online' if navigator.onLine
    Backbone.history.start({ pushState: true })
