#= require jquery-2.1.1
#= require underscore-min
#= require backbone-min
#= require backbone.dualstorage
#= require backbone.syphon
#= require date
#= require s3_direct_upload
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
    if navigator.userAgent.match(/iphone|ipad|ipod/i) && ! navigator.standalone
      ds.installer.run()
    else
      @run(data)

  run: (data) ->
    if data.current_user?
      @user = new Phonebook.Models.User(data.current_user)

      $.ajaxPrefilter (options, originalOptions, jqXHR) =>
        #options.url += "?token=#{@user.get('auth_token')}"
        jqXHR.withCredentials = true
        console.log options.url

      @schools = new Phonebook.Collections.SchoolsCollection(@user.get('schools'))

      @controller = new Phonebook.Controllers.AppController
          el: '#phonebook'
          
      Backbone.trigger 'app:loaded'
      Backbone.trigger("network:#{navigator.onLine}")
      Backbone.history.start({ pushState: true })

    else
      location.href = '/sessions/new'

