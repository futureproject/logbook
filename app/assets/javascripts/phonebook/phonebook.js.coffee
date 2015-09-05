#= require jquery-2.1.1
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require backbone.paginator.min
#= require jquery.animate-enhanced
#= require tappy
#= require date
#= require_self
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers
#= require ./router

window.ds ||= {}
ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.init = ->
  document.body.classList.add("standalone") if navigator.standalone
  ds.controllers.sessions = new ds.SessionsController
  ds.controllers.notifications = new ds.NotificationsController
  ds.controllers.people = new ds.PeopleController
  ds.user = new ds.UserCollection
  ds.router = new ds.Router
  ds.views.app_view = new ds.AppView
  if ds.user.current()?
    ds.run()
  else
    Backbone.trigger "sessions:do", "new"

ds.run = ->
  Backbone.history.start({ pushState: true })

