class ds.PeopleSearchView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @$input = $("<input type='text' name='q' placeholder='Search' />")
    @$canceller = $("<div class='cancel'>Cancel</div>")
    @$resetter = $("<div class='reset icon-cancel' />")

  className: 'search'

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
    @search @$el.val()
  , 200)

  search: (query) ->
    return unless query.length > 1
    console.log 'searching!!'
    console.log @$input.val()

  onfocus: (event) ->
    # show cancel button
    @$el.addClass('focused')
    console.log 'focused!'

  onblur: (event) ->
    # hide cancel button
    @$el.removeClass('focused')
    @$input.val('')
    console.log 'blurred!'

  cancel: (event) ->
    event.stopPropagation()
    Backbone.trigger "people:search:cancelled"

  reset: (event) ->
    event.stopPropagation()
    event.preventDefault()
    @$input.val('').focus()

