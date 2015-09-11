#= require jquery-2.1.1
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require backbone.paginator.min
#= require jquery.animate-enhanced
#= require date
#= require titlecase
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers
#= require ./router
#= require_self

window.ds ||= {}
ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.init = ->
  ds.cssHelper.init()
  document.body.classList.add("standalone") if navigator.standalone
  ds.controllers.sessions = new ds.SessionsController
  ds.controllers.notifications = new ds.NotificationsController
  ds.user = new ds.UserCollection
  ds.router = new ds.Router
  ds.views.app = new ds.AppView
  if ds.user.current()?
    ds.run()
  else
    Backbone.trigger "sessions:do", "new"

ds.run = ->
  ds.controllers.people = new ds.PeopleController
  ds.collections.engagements = new ds.EngagementsCollection
  ds.collections.schools = new ds.SchoolsCollection
  Backbone.history.start({ pushState: true })

