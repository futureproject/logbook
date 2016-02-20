ds.models = {}
ds.views = {}
ds.controllers ={}
ds.collections ={}

ds.init = ->
  ds.controllers.notifications = new ds.NotificationsController
  ds.IDENTITY = new ds.Identity
  # ds.views.app listens to an event that fires
  # after ds.User has loaded from either localStorage or the server.
  # on user:ready, ds.views.app calls "run" which boots the app
  ds.views.app = new ds.AppView
    el: "body"
  ds.IDENTITY.setup()

ds.init()
