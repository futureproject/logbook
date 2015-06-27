window.ds ||= {}

class ds.ScopeToggleView extends Backbone.View
  initialize: ->
    @menu = new ds.ScopeMenuView()

  events:
    'click': (event) -> Backbone.trigger 'nav:toggle'

class ds.ScopeMenuView extends Backbone.View
  initialize: ->
    @visible = false
    @render()
    @listenTo Backbone, 'nav:toggle', @toggle

  className: 'scope-menu'
  id: 'scope-menu'
  toggle: ->
    if @visible then @hide() else @show()

  hide: ->
    @$el.hide()
    @visible = false

  show: ->
    @visible = true
    @$el.show()

  render: ->
    @$el.hide().appendTo('body').html(@template(ds.CONSTANTS.scopes))

  template: _.template "<h1>I am the scopes menu</h1>"
