window.ds ||= {}

class ds.ScopeToggleView extends Backbone.View
  initialize: ->
    @$el.find('#current-scope-indicator').html ds.CONSTANTS.scope.name
  el: '#scope-toggle'
  events:
    'click': (event) -> Backbone.trigger 'nav:toggle'

class ds.ScopeMenuView extends Backbone.View
  initialize: ->
    @hide()
    @sites = { el: '#sites-list', collection: ds.collections.sites }
    @schools = { el: '#schools-list', collection: ds.collections.schools }
    @listenTo @schools.collection, 'reset', @render
    @listenTo @sites.collection, 'reset', @render
    @listenTo Backbone, 'nav:toggle', @toggle

  el: '#scope-menu'
  toggle: ->
    if @visible then @hide() else @show()

  hide: ->
    @$el.slideUp()
    @visible = false

  show: ->
    @$el.slideDown()
    @visible = true

  template: JST['logbook/templates/scopes']

  render: ->
    _.each [@sites, @schools], (set) =>
      list = document.createElement('ul')
      set.collection.each (model) =>
        item = document.createElement('li')
        item.innerHTML = @template(model.tplAttrs())
        list.appendChild item
      $(set.el).html list

