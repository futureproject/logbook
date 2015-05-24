Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.MultiSelectView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @collectionClass = args.collectionClass
    @namespace = @collectionClass.namespace || 'base'
    console.log @namespace
    @selectionProperty = args.selectionProperty || 'children'
    @searchAttrs = args.searchAttrs || ['name']
    @render()
    @initSubViews()
    @listen()

  className: 'detail detail-modal'
  template: JST['phonebook/templates/base/multi_select']
  events:
    'touchend .done': 'done'
    'touchmove .titlebar': (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, "#{@namespace}:search:removed", => @hide()

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
      selectionList: new Phonebook.Views.Base.SelectionView
        model: @model
        association: @selectionProperty

  removeSubviews: ->
    _.each @subViews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super

  done: (e) ->
    e.preventDefault()
    event.preventDefault()
    @hide()
