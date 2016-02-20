class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # log each AJAX request, for debugging
    $(document).on('ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
    ).on('ajaxError', (event, xhr, options) ->
      # force user to reauthenticate if they've been logged out
      if xhr.status == 403 && !options.url.match(/me/i)
        Backbone.trigger "app:authenticate"
    )
    # make requests default to JSON
    $.ajaxSetup
      dataType: 'json'

    @listenTo Backbone, 'app:nav', @showNav
    @listenTo Backbone, 'app:resetScroll', @resetScrollPosition
    @listenTo Backbone, 'app:authenticate', @showAuth
    @listenTo Backbone, 'app:register', @showRegistration
    @listenTo Backbone, 'app:logout', @logOut
    @listenToOnce Backbone, 'app:auth_complete', @run
    @render()

  resetScrollPosition: (pos) ->
    pos ||= 0
    @$el.scrollTop(pos)

  showNav: ->
    @views.menu = new ds.MenuView
    $('body').append @views.menu.render().el

  render: ->
    @$el.empty()

  showAuth: ->
    $.ajax
      url: "#{ds.apiHelper.urlFor("sessions")}?redirect_to=/mobile"
      dataType: "html"
      success: (response) =>
        div = document.createElement('div')
        div.innerHTML = response
        @$el.html $(div).find("#new-session")

  showRegistration: ->
    $.ajax
      url: "#{ds.apiHelper.urlFor("registrations")}?redirect_to=/mobile"
      dataType: "html"
      success: (response) =>
        div = document.createElement('div')
        div.innerHTML = response
        @$el.html $(div).find("#registration")

  logOut: ->
    @$el.html new ds.SpinnerView().render().el
    localStorage.clear()
    $.ajax
      url: "/auth/logout",
      complete: =>
        localStorage.setItem('phonebook_launched', "true")
        if navigator.standalone
          # prompt iOS Home Screen Web App™ users to sign out of their
          # third-party oauth accounts
          # TODO: make this url smarter, to allow signing out of other Oauth services
          location.href = "https://accounts.google.com/SignOutOptions"
        else
          @showAuth()

  run: ->
    ds.cssHelper.init()
    # initialize ppl database and restore from localstorage, then server
    ds.collections.people = new ds.PeopleCollection
    ds.collections.people.bootstrap()

    # ditto engagements
    #ds.collections.engagements = new ds.EngagementsCollection
    #ds.collections.engagements.bootstrap()

    # now a controller for storing just this session's data
    ds.controllers.session_storage = new ds.SessionStorageController

    ds.controllers.people = new ds.PeopleController
    ds.controllers.engagements = new ds.EngagementsController
    ds.router = new ds.Router
    Backbone.history.start({ pushState: true })
    first_run = !localStorage.getItem('phonebook_launched')
    if first_run
      msg = "<p>Welcome, #{ds.IDENTITY.get('first_name')}. Your people are downloading.</p><p>If you don't see who you're looking for, use the search field to find or add someone.</p>"
      Backbone.trigger "notification", msg, 10000
      localStorage.setItem('phonebook_launched', "true")

