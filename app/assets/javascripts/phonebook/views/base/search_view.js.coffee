Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection
    @listenTo Backbone, args?.enablingEvents, @enable
    @listenTo Backbone, args?.disablingEvents, @disable
    @searchAttrs = args.searchAttrs || ['name']
    throw 'SearchView needs a collection to search' unless @collection

  events:
    'keyup' : 'throttledSearch'
    'focus' : 'onfocus'
    'blur' : 'onblur'

  render: ->
    @$el.html @$input
    @

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$el.val()
    @search()
  , 200)

  search: ->
    collection = @collection.fullCollection || @collection
    results = collection.filter (model) =>
      searchString = ""
      _.each @searchAttrs, (attr) -> searchString += model.get(attr) + " "
      searchString.trim().toLowerCase().match(@q.toLowerCase())
    console.log results
    @collection.trigger 'filtered', results

  onfocus: ->
    Backbone.trigger 'searchView:in', @
    @collection.trigger('reset') if @$el.val().length > 0
    @$el.val('')

  onblur: ->
    Backbone.trigger 'searchView:out', @

  enable: ->
    window.setTimeout =>
      @$el.removeAttr('disabled')
    , 500

  disable: () ->
    @$el.attr('disabled', 'disabled').blur()

