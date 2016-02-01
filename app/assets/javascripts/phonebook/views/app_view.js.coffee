class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # log each AJAX request, for debugging
    $(document).on('ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
    ).on('ajaxError', (event, xhr, options) ->
      # force user to reauthenticate if they've been logged out!
      if xhr.status == 403
        Backbone.trigger "app:authenticate"
    )
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

  showAuth: -> location.href = "/sessions/new?redirect_to=/mobile"

  logOut: -> location.href = "/auth/logout"

