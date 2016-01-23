#= require jquery2
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require jquery.animate-enhanced
#= require s3_cors_upload
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
  ds.views.app = new ds.AppView
    el: "body"
  # initialize ppl database and restore from localstorage, then server
  ds.collections.people = new ds.PeopleCollection
  ds.collections.people.bootstrap()

  # ditto engagements
  # another just for storing this session's engagements
  ds.collections.engagements = new ds.EngagementsCollection
  #ds.collections.engagements.bootstrap()

  ds.controllers.sessions_storage = new ds.SessionStorageController
  ds.controllers.people = new ds.PeopleController
  ds.controllers.notifications = new ds.NotificationsController
  ds.controllers.engagements = new ds.EngagementsController
  #ds.collections.schools = new ds.SchoolsCollection
  ds.router = new ds.Router
  Backbone.history.start({ pushState: true })

