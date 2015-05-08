Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.TabView extends Backbone.View
  initialize: (args) ->
    @$container = $(args.container)
    @collection = args.collection
    @namespace = args.namespace || 'base'
    @render()
    @initSubViews()
    @listen()

  className: 'table'

  events:
    'touchmove .titlebar': (e) -> e.preventDefault()
    'click .titlebar h1': (e) -> @$el.find('.scrollable').animate({ scrollTop: 0 })
    'touchend .new': (event) ->
      event.preventDefault()
      Backbone.trigger "#{@namespace}:new"

  listen: ->
    @listenTo Backbone, "#{@namespace}:views:shown", @onViewShow

  render: ->
    @$el.html @template
    @$container.append @$el

  remove: ->
    @removeSubviews()
    super

  initSubViews: -> @subViews ||= {}

  removeSubviews: ->
    _.each @subViews, (view) -> view.remove()

  slide: -> @$el.addClass('shifted')

  unslide: -> @$el.removeClass('shifted')

  onViewShow: (type) ->
    @slide() if type == 'detail'

  show: ->
    Backbone.trigger "#{@namespace}:router:update", "phonebook/#{@namespace}"
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')
