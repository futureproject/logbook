Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.TableView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection
    @item_view = args?.item_view
    throw "TableView needs collection and item view" unless @collection && @item_view
    @listenTo @collection, 'change:selected', @clearSelection
    @listenTo @collection, 'remove reset add', @render
    #@listenTo @collection, 'filtered', @filter

  events: ->
    'touchstart': 'loadNextPage'
    #'change': (event) ->

  render: ->
    console.log "rendered TableView index with #{@collection.length} models"
    fragment = document.createDocumentFragment()
    @subCount = 0
    for model in @collection.models
      view = new @item_view
        model: model
      view.listenTo @, 'cleanup', view.remove
      fragment.appendChild view.render().el
      @subCount += 1
    @$el.html fragment
    # prevent iOS scroll bounce before any interactions occur
    @el.scrollTop = 1 if @el.scrollTop == 0
    if @collection.length == 0
      @$el.prepend('<div class="loading"></div>')

  removeItems: ->
    @trigger 'cleanup'

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected

  remove: ->
    @removeItems()
    super

  loadNextPage: (e) ->
    return unless @collection.state?
    el = e.currentTarget
    height = el.getBoundingClientRect().height
    scrollPos = el.scrollHeight - el.scrollTop
    if Math.abs(scrollPos - height) < 400 && @collection.length < @collection.state.totalRecords && @collection.length >= @collection.state.pageSize
      @collection.setPageSize @collection.state.pageSize + 50
