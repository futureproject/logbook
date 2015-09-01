Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.TableView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection
    @item_view = args?.item_view
    throw "TableView needs collection and item view" unless @collection && @item_view
    @listenTo @collection, 'change:selected', @clearSelection
    @listenTo @collection, 'reset', @render

  events: ->
    'click .load-more': 'loadNextPage'
    #'change': (event) ->

  render: ->
    console.log "rendered view #{@cid} with #{@collection.length} models"
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new @item_view
        model: model
      view.listenTo @, 'clean', view.remove
      fragment.appendChild view.render().el
    @$el.html(fragment)
    # prevent iOS scroll bounce before any interactions occur
    @el.scrollTop = 1 if @el.scrollTop == 0
    if @collection.length == 0
      @loader = new Phonebook.Views.Base.LoadingView()
      @$el.prepend @loader.el
    # append "load more"
    @$el.append("<div class='recessed-button load-more'>Load More</div>") if @hasMoreResults()

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected

  remove: ->
    @trigger 'clean'
    super

  loadNextPage: (e) ->
    return unless @collection.state?
    @collection.setPageSize @collection.state.pageSize + 50

  hasMoreResults: ->
    if (@collection.state? && @collection.length < @collection.state.totalRecords && @collection.length >= @collection.state.pageSize)
      true
    else
      false
