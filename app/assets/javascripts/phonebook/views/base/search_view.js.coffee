Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  template: JST['phonebook/templates/base/search']
  initialize: (args) ->
    @collection = args?.collection
    ds.bootstrapper.bootstrap @collection
    @clonedCollection = _.clone @collection
    @$container = args?.container
    @searchAttrs = args.searchAttrs || ['name']
    throw 'SearchView needs a collection to search' unless @collection
    @render()
    @listenTo @collection, 'change:selected', @onselect

  events:
    'keyup' : 'throttledSearch'
    #'focus input' : 'onfocus'
    #'blur' : 'onblur'
    'touchend .r-menu': 'remove'

  render: ->
    @$container.html @$el.html(@template)

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$el.find('input').val()
    @search()
  , 200)

  search: ->
    if @q?.length > 1
      collection = @clonedCollection
      results = collection.filter (model) =>
        searchString = ""
        _.each @searchAttrs, (attr) -> searchString += model.get(attr) + " "
        searchString.trim().toLowerCase().match(@q.toLowerCase())
      results = if results.length > 0 then results else @conditionallyAddNewRecord()
      @collection.reset(_.first(results, 10))

  remove: ->
    @collection.reset @clonedCollection.models
    super

  onselect: ->
    @$el.find('input').blur()

  conditionallyAddNewRecord: ->
    return [] unless _.contains(@searchAttrs,'createable') && @q?.length > 1
    q = @q.split(" ")
    if _.contains @searchAttrs, 'first_name'
      first_name = q.shift()
      last_name= q.join(' ')
      if (first_name?.length > 0 && last_name?.length > 0)
        [{ first_name: first_name, last_name: last_name, name: first_name + " " + last_name }]
      else
        []
    else if _.contains @searchAttrs, 'name'
      [{ name: @q }]
    else
      []

