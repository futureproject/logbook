#= require jquery2
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require date
#= require titlecase
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers
#= require ./router

ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.init = (user_info) ->
  ds.CURRENT_USER = new ds.User(user_info)
  ds.cssHelper.init()
  ds.run()

ds.run = ->
  ds.controllers.people = new ds.PeopleController
  #ds.controllers.notifications = new ds.NotificationsController
  #ds.controllers.engagements = new ds.EngagementsController
  #ds.collections.schools = new ds.SchoolsCollection
  ds.views.app = new ds.AppView
  ds.router = new ds.Router
  Backbone.history.start({ pushState: true })

