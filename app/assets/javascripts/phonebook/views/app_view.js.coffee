class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # log each AJAX request, for debugging
    $(document).on('ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
    ).on('ajaxError', (event, xhr, options) ->
      # force user to reauthenticate if they've been logged out
      if xhr.status == 403
        Backbone.trigger "app:authenticate"
    )
    # make requests default to JSON
    $.ajaxSetup
      dataType: 'json'

    @listenTo Backbone, 'app:nav', @showNav
    @listenTo Backbone, 'app:resetScroll', @resetScrollPosition
    @listenTo Backbone, 'app:authenticate', @showAuth
    @listenTo Backbone, 'app:logout', @logOut
    @render()

  resetScrollPosition: (pos) ->
    console.log 'resetting scroll pos...'
    pos ||= 0
    @$el.scrollTop(pos)

  showNav: ->
    @views.menu = new ds.MenuView
    $('body').append @views.menu.render().el

  render: ->
    @$el.empty()

  auth_template: _.template "
    <div class='auth-container'>
      <div class='auth-trigger'>Sign In</div>
    </div>
  "
  showAuth: ->
    @$el.html @auth_template()
    @$el.one 'click', '.auth-trigger', (event) ->
      location.href="/phonebook/auth"

  logOut: ->
    @$el.html new ds.SpinnerView().render().el
    $.ajax
      url: "/auth/logout",
      complete: =>
        if navigator.standalone
          # prompt iOS Home Screen Web App™ users to sign out of their
          # google accounts
          location.href = "https://accounts.google.com/SignOutOptions"
        else
          @showAuth()

