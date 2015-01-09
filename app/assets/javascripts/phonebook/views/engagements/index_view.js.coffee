Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.IndexView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection
    @listenTo @collection, 'reset add', @render

  template: JST['phonebook/templates/engagements/index']

  events:
    'tap .new': (e) -> Backbone.trigger 'engagements:new', e
    'touchmove .list-title': (e) -> e.preventDefault()

  render: ->
    @$el.html @template
    @list = new Phonebook.Views.Engagements.ListView(
      collection: @collection
      el: '#engagements-list-items'
    ).render()

  animateIn: ->
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @list?.remove()

  show: ->
    @render()
    @$el.addClass('active').removeClass('shifted')

  hide: ->
    @$el.removeClass('active')
