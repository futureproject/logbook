class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # log each AJAX request, for debugging
    $(document).on 'ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
    @listenTo Backbone, 'scroll:reset', @resetScrollPosition
    @listenTo Backbone, 'app:nav', @showNav

  resetScrollPosition: (pos) ->
    pos ||= 0
    $('body').scrollTop(pos)

  showNav: ->
    @views.menu = new ds.MenuView
    $('body').append @views.menu.render().el
