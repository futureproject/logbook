Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  template: JST['oldbook/templates/base/search']
  initialize: (args) ->
    @namespace = args.namespace
    @$container = args?.container
    @searchAttrs = args.searchAttrs || ['name']
    @render()
    @setCollection(args.collection)
    Backbone.trigger 'search:initialized', @
    @listenTo Backbone, 'search:focus', ->
      @$el.find('input').focus()

  setCollection: (collection) ->
    @collection = collection
    @listenTo @collection, "reset", (collection) =>
      @clonedCollection = _.clone @collection
      @listenTo @collection, 'change:selected', @onSelect
    ds.bootstrapper.bootstrap @collection

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
      collection = @clonedCollection.fullCollection || @clonedCollection
      results = collection.filter (model) =>
        searchString = ""
        _.each @searchAttrs, (attr) -> searchString += model.get(attr) + " "
        searchString.trim().toLowerCase().match(@q.toLowerCase())
      results = if results.length > 0 then results else @conditionallyAddNewRecord()
      @collection.reset(_.first(results, 10))
      Backbone.trigger 'search:results', @collection

  remove: ->
    if @collection
      ds.bootstrapper.loadLocal(@collection)
      Backbone.trigger "#{@namespace}:search:removed"
      @collection.stopListening()
      @collection = null
    super

  onSelect: ->
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

