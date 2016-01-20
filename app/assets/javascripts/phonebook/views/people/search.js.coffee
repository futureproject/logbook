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

  search: (query) ->
    return unless query.length > 1
    q = query.toLowerCase()
    # find local results and return them
    results = @collection.clone().filter (person) ->
      first = person.get('first_name')
      last = person.get('last_name')
      searchString = (first + " " + last).toLowerCase().trim()
      searchString.match(q)
    results_collection = new Backbone.Collection(results)
    Backbone.trigger "people:search:results", query, results_collection
    # now search for remote results and return those too
    $.ajax
      url: "#{@collection.url()}/search"
      data: {q: q}
      complete: (response) =>
        server_results = response.responseJSON
        if server_results.length > 0
          results_collection.add server_results
          console.log results_collection
          Backbone.trigger "people:search:results", query, results_collection

  onfocus: (event) ->
    # show cancel button
    @$el.addClass('focused')
    Backbone.trigger 'people:search:in'

  onblur: (event) ->
    # hide cancel button
    @$el.removeClass('focused')
    Backbone.trigger 'people:search:out'
    @$input.val('')

  cancel: (event) ->
    event.stopPropagation()
    Backbone.trigger "people:search:cancelled"

  reset: (event) ->
    event.stopPropagation()
    event.preventDefault()
    @$input.val('').focus()

