window.ds ||= {}
class ds.FiltersView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'filters:toggle', @toggle

  events:
    'click a': 'animateOut'

  toggle: -> @$el.slideToggle 'fast', -> Backbone.trigger 'filters:toggled'

  animateOut: (event) ->
    link = event.target.href
    return unless link?
    event.preventDefault()
    $('#yield').html '<div class="lb-loading">Loading...</div>'
    @$el.slideUp 'fast', -> location.href = link


class ds.FiltersToggleView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'filters:toggle', ->
      $('html, body').animate
        scrollTop: 0
  events:
    'click': 'toggle'

  toggle: ->
    @$el.toggleClass('open')
    Backbone.trigger 'filters:toggle', @

$ ->
  ds.filters_view = new ds.FiltersView
    el: '#filters'

  ds.filters_toggle_view = new ds.FiltersToggleView
    el: '#filter-trigger'

  $('.filtres-trigger').on('click', (e) ->
    $('.page-header').toggleClass('filtres-open')
    $('.filtres').slideToggle 'fast'
  )
