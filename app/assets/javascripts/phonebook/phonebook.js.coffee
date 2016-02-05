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
  console.log user_info
  ds.views.app = new ds.AppView
    el: "body"
  if user_info
    ds.CURRENT_USER = new ds.User(user_info)
    ds.cssHelper.init()
    ds.run()
  else
    Backbone.trigger "app:authenticate"

ds.run = ->
  # initialize ppl database and restore from localstorage, then server
  ds.collections.people = new ds.PeopleCollection
  ds.collections.people.bootstrap()

  # ditto engagements
  #ds.collections.engagements = new ds.EngagementsCollection
  #ds.collections.engagements.bootstrap()

  # now a controller for storing just this session's data
  ds.controllers.session_storage = new ds.SessionStorageController

  ds.controllers.people = new ds.PeopleController
  ds.controllers.notifications = new ds.NotificationsController
  ds.controllers.engagements = new ds.EngagementsController
  ds.router = new ds.Router
  Backbone.history.start({ pushState: true })
  if ds.collections.people.length == 0
    msg = "<p>Welcome, #{ds.CURRENT_USER.get('first_name')}. Your people are downloading.</p><p>If you don't see who you're looking for, use the search field to find or add someone.</p>"
    Backbone.trigger "notification", msg, 10000

