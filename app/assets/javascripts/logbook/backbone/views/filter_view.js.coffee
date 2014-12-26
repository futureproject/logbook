window.ds ||= {}
class ds.FiltersView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'filters:toggled', @toggle

  toggle: -> @$el.slideToggle()

class ds.FiltersToggleView extends Backbone.View
  events:
    'click': 'toggle'

  toggle: ->
    @$el.toggleClass('open')
    Backbone.trigger 'filters:toggled', @

$ ->
  ds.filters_view = new ds.FiltersView
    el: '#filters'

  ds.filters_toggle_view = new ds.FiltersToggleView
    el: '#filter-trigger'
