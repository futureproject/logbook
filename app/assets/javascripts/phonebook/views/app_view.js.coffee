class ds.AppView extends Backbone.View
  initialize: ->
    @views = {}
    # log each AJAX request, for debugging
    $(document).on 'ajaxSend', (event, xhr, options) ->
      console.log "AJAX request to #{options.url}"
    @listenTo Backbone, 'app:nav', @showNav
    @listenTo Backbone, 'app:resetScroll', @resetScrollPosition
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
