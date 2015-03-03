Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.IndexView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @collection = args.collection
    @listenTo Backbone, 'engagements:views:shown', @onViewShow
    @rendered = false
    @list = new Phonebook.Views.Engagements.ListView(
      collection: @collection
    )

  template: JST['phonebook/templates/engagements/index']

  className: 'list'

  events:
    'touchend .new': (e) ->
      e.preventDefault()
      Backbone.trigger 'engagements:new'
    'touchmove .list-title': (e) -> e.preventDefault()

  render: ->
    @$el.html @template
    @$container.append @$el
    @list.setElement('#engagements-list-items').render()
    @rendered = true

  renderOnce: ->
    return if @rendered
    @render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @list?.remove()

  show: ->
    @renderOnce()
    Backbone.trigger 'engagements:router:update', 'phonebook'
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')

  slide: -> @$el.addClass('shifted')
  unslide: -> @$el.removeClass('shifted')

  onViewShow: (type) ->
    @slide() if type == 'detail'
