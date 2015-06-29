window.ds ||= {}

class ds.ScopeToggleView extends Backbone.View
  initialize: ->
    @menu = new ds.ScopeMenuView

  events:
    'click': (event) -> Backbone.trigger 'nav:toggle'

class ds.ScopeMenuView extends Backbone.View
  initialize: ->
    @visible = false
    @collection = ds.collections.sites
    @listenTo @collection, 'reset', @render
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

  template: JST['logbook/templates/scopes']

  render: ->
    @$el.hide().appendTo('body')
    fragment = document.createDocumentFragment()
    @collection.each (model) =>
      console.log model
      div = document.createElement('div')
      div.innerHTML = @template(model.toJSON())
      fragment.appendChild div
    @$el.html(fragment)

