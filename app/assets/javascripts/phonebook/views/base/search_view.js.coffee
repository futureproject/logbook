Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchView extends Backbone.View
  initialize: (args) ->
    @showing = false
    @$input = $("<input autocorrect='off' autocapitalize='off' autocomplete='off' name='q' type='text' placeholder='Search' >")
    @collection = args?.collection
    @listenTo Backbone, args?.hidingEvents, (event) -> @$input.blur()
    throw 'SearchView needs a collection to search' unless @collection

  events:
    'keyup' : 'throttledSearch'
    'blur input' : 'onBlur'

  reset: ->
    @q = null
    @$input.val('')
    @$input.blur() if @$input.is(':focus')
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
    @collection.trigger 'filtered', []
    @showing = true
    @$el.addClass('active')
    @$el.parent().addClass('search-active')

  hide: ->
    @showing = false
    @$el.removeClass('active')
    @reset()
    @$el.parent().removeClass('search-active')

  onBlur: ->
    if !@q? || @q.length == 0
      @hide()
