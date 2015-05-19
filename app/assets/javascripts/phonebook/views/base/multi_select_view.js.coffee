Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.MultiSelectView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @namespace = args.namespace || 'base'
    @searchAttrs = args.searchAttrs || ['name']
    @render()
    @initSubViews()
    #@listen()

  className: 'detail detail-multi-select'
  template: JST['phonebook/templates/base/multi_select']
  events:
    'touchend .done': 'done'
    'touchmove .titlebar': (e) -> e.preventDefault()

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    #Backbone.trigger "#{@namespace}:router:update", (@model.id || @model.cid)
    Backbone.trigger "#{@namespace}:views:shown", 'modal'
    @$container.append @$el.addClass(animation)
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)

  hide: (animation) ->
    animation ||= 'slide-out-vertical'
    Backbone.trigger "#{@namespace}:views:hidden", @
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )

  render: ->
    @$el.html(@template @model.tplAttrs())
    @$el.find('.scrollable').scrollTop(1)

  initSubViews: ->
    @subViews ||=
      search: new Phonebook.Views.Base.SearchView
        namespace: @namespace
        container: @$el.find '.multi-select-input-wrapper'
        searchAttrs: @searchAttrs
      #searchResultsList: new Phonebook.Views.Base.SearchResultsView
        #el: @el.querySelector '.multi-select-search-results'

  removeSubviews: ->
    _.each @subViews, (view) -> view.remove()

  done: (e) ->
    e.preventDefault()
    event.preventDefault()
    @hide()
