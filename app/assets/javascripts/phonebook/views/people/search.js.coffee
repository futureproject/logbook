class ds.PeopleSearchView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @$input = $("<input type='text' placeholder='Find or add person' autocomplete='off' autocorrect='off' autocapitalize='off' name='q'>")
    @$canceller = $("<div class='cancel'>Cancel</div>")
    @$resetter = $("<div class='reset icon-cancel' />")

  events:
    'click .cancel': 'cancel'
    'click .reset': 'reset'
    'click': 'focus'
    'keyup': 'throttledSearch'
    'focus input': 'onfocus'
    'blur input': 'onblur'

  render: ->
    fragment = document.createDocumentFragment()
    $(fragment).append(@$input).append(@$canceller).append(@$resetter)
    @$el.html fragment
    @

  focus: ->
    return if @$input.is(":focus")
    @$input.focus()

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @search @$input.val()
  , 200)

  search: (query) -> @collection.search(query)

  onfocus: (event) ->
    # show cancel button
    @$el.addClass('focused')
    Backbone.trigger 'people:searchView:in'

  onblur: (event) ->
    # hide cancel button
    @$el.removeClass('focused')
    Backbone.trigger 'people:searchView:out'
    @$input.val('')

  cancel: (event) ->
    event.stopPropagation()
    Backbone.trigger "people:searchView:cancelled"

  reset: (event) ->
    event.stopPropagation()
    event.preventDefault()
    @$input.val('').focus()

