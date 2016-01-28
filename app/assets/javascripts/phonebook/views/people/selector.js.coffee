class ds.PersonSelectorView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    # set the standard peoplecollection if there isn't one supplied
    @collection ||= ds.collections?.people
    @collection.bootstrap()
    @field_name ||= "person_ids"
    @field_label ||= "People"
    @listen()

  className: 'field selector-field'

  template: JST["phonebook/templates/people/selector"]

  listen: ->
    @listenTo @collection, 'search:results', @showResults

  events:
    'keyup input': 'throttledSearch'
    'click li': (event) -> console.log event

  render: ->
    @$el.html @template @tplAttrs()
    @postRender()
    @

  tplAttrs: ->
    field_name: @field_name
    field_label: @field_label

  postRender: ->
    @$results = @$el.find('ul')
    # render selected people

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @search e.currentTarget.value
  , 200)

  search: (query) ->
    if query.length > 0
      @collection.search(query)
    else
      @clearResults()

  showResults: (query, results) ->
    frag = document.createDocumentFragment()
    for person in results.first(4)
      item = document.createElement('li')
      item.innerHTML = "#{person.get('first_name')} #{person.get('last_name')}"
      frag.appendChild item
    @$results.html frag

  clearResults: ->
    @$results.empty()
