Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.TabView extends Backbone.View
  initialize: (args) ->
    @$container = $(args.container)
    @collection = args.collection
    @namespace = args.namespace || 'base'
    @searchAttrs = args.searchAttrs
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
    'click .icon-search': 'showSearch'

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
    Backbone.trigger "#{@namespace}:router:update", "oldbook/#{@namespace}"
    @$el.addClass('active')
    @unslide()

  hide: ->
    @$el.removeClass('active')

  showSearch: (event) ->
    return if @subViews.search?.$el.is(":visible")
    @subViews.search = new Phonebook.Views.Base.SearchView
      namespace: @namespace
      container: @$el.find('.titlebar-search-container')
      searchAttrs: @searchAttrs
      collection: @collection

    @subViews.search.$el.find('input').focus()

