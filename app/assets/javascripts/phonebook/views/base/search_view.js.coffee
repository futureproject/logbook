Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  initialize: (args) ->
    @showing = false
    @$input = $("<input name='q' type='text' placeholder='Search...' >")
    @collection = args?.collection
    @listenTo Backbone, 'people:show', @hide
    throw 'SearchView needs a collection to search' unless @collection

  events:
    'keyup' : 'throttledSearch'

  reset: ->
    @$input.val('').blur()
    @collection.trigger('reset')

  render: ->
    @$el.html @$input
    @

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$input.val()
    @search()
  , 200)

  search: ->
    collection = @collection.fullCollection || @collection
    results = collection.filter (person) =>
      person.get('name').toLowerCase().match(@q.toLowerCase())
    @collection.trigger 'filtered', results

  toggle: ->
    if @showing then @hide() else @show()

  show: ->
    @showing = true
    @$el.addClass('active')
    @$el.parent().addClass('search-active')

  hide: ->
    @showing = false
    @$el.removeClass('active')
    @reset()
    @$el.parent().removeClass('search-active')
