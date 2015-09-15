class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # add session credentials to each ajax request
    $(document).on 'ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
      user = ds.user.current()
      return unless user
      xhr.setRequestHeader "X-DS-USER", user.get('email')
      #xhr.setRequestHeader "X-DS-SCOPE-TYPE", user.get('scope_type')
      #xhr.setRequestHeader "X-DS-SCOPE-ID", user.get('scope_id')
    @listenTo Backbone, 'scroll:reset', @resetScrollPosition
    @listenTo Backbone, 'app:nav', @showNav

  resetScrollPosition: (pos) ->
    pos ||= 0
    $('body').scrollTop(pos)

  showNav: ->
    @views.menu = new ds.MenuView
    $('body').append @views.menu.render().el