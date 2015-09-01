#= require jquery-2.1.1
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require backbone.paginator.min
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

ds.run = ->
  ds.views.session = new ds.SessionView
  ds.user = new ds.UserCollection
  ds.router = new ds.Router
  if ds.user.current()?
    Backbone.history.start({ pushState: true })
  else
    Backbone.trigger 'sessions:new'

