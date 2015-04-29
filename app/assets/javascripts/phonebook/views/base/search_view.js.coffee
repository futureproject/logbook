Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection
    @listenTo Backbone, args?.enablingEvents, @enable
    @listenTo Backbone, args?.disablingEvents, @disable
    throw 'SearchView needs a collection to search' unless @collection

  events:
    'keyup' : 'throttledSearch'
    'focus' : 'onfocus'
    #'blur' : 'reset'

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
    results = collection.filter (person) =>
      name = ("#{person.get('first_name')} #{person.get('last_name')}").toLowerCase()
      name.match(@q.toLowerCase())
    @collection.trigger 'filtered', results

  onfocus: ->
    @collection.trigger('reset') if @$el.val().length > 0
    @$el.val('')

  enable: ->
    window.setTimeout =>
      @$el.removeAttr('disabled')
    , 500

  disable: () ->
    @$el.attr('disabled', 'disabled').blur()

