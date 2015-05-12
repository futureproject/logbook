Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  template: JST['phonebook/templates/base/search']
  initialize: (args) ->
    @collection = args?.collection
    @clonedCollection = _.clone @collection
    @$container = args?.container
    @searchAttrs = args.searchAttrs || ['name']
    throw 'SearchView needs a collection to search' unless @collection
    @render()
    @listenTo @collection, 'change:selected', @onselect

  events:
    'keyup' : 'throttledSearch'
    'focus' : 'onfocus'
    'blur' : 'onblur'
    'touchend .r-menu': 'remove'

  render: ->
    @$container.html @$el.html(@template)

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$el.find('input').val()
    @search()
  , 200)

  search: ->
    return unless @q?.length > 1
    collection = @clonedCollection.fullCollection || @clonedCollection
    results = collection.filter (model) =>
      searchString = ""
      _.each @searchAttrs, (attr) -> searchString += model.get(attr) + " "
      console.log searchString
      searchString.trim().toLowerCase().match(@q.toLowerCase())
    @collection.reset(_.first(results, 10))

  remove: ->
    @collection.reset @clonedCollection.models
    super

  onselect: ->
    @$el.find('input').blur()
