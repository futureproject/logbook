Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  initialize: (args) ->
    @$input = $("<input name='q' type='text' >")
    @collection = args?.collection
    throw 'SearchView needs a collection to search' unless @collection

  events:
    'keyup' : 'throttledSearch'
    'blur input' : 'reset'

  reset: ->
    @$input.val('')
    @collection.trigger 'reset'

  render: ->
    @$el.html @$input
    @

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$input.val()
    @search()
  , 200)

  search: ->
    Backbone.trigger 'search:started'
    if @q.length > 0
      collection = @collection.fullCollection || @collection
      results = collection.filter (person) =>
        person.get('name').toLowerCase().match(@q.toLowerCase())
      @collection.trigger 'filtered', results
    else
      @reset()

