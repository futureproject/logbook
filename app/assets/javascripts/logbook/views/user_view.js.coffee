class ds.UserView extends Backbone.View
  initialize: ->
    @visible = true
    @listenTo Backbone, 'nav:toggle', @toggle

  toggle: ->
    if @visible then @hide() else @show()

  hide: ->
    @$el.hide()
    @visible = false

  show: ->
    @visible = true
    @$el.show()

