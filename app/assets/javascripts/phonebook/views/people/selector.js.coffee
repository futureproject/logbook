class ds.PersonSelectorView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    # use ds.peoplecollection for searching if there isn't
    # another collection supplied
    @collection ||= ds.collections?.people
    # load searchable data from localStorage, then the server
    @collection.bootstrap()
    # create a collection to hold selected people
    @selection = new ds.PeopleCollection
    #set default field names
    @field_name ||= "person_ids"
    @field_label ||= "People"
    #listen for data events
    @listen()

  className: 'field selector-field'

  template: JST["phonebook/templates/people/selector"]

  #listen for data-based events
  listen: ->
    # when the collection pings results, update the UI
    @listenTo @collection, 'search:results', @updateSearchResults
    @listenTo @selection, 'add remove', @updateOptions

  #listen for UI events
  events:
    'keyup input': 'throttledSearch'
    'click .selector-options li': 'deselectOption'
    'click .selector-search-results li': 'selectResult'
    # switch titlebars to relative positioning, to allow
    # for scrolling on iOS devices
    'focus input': -> $('.titlebar').addClass('rel')
    'blur input': -> $('.titlebar').removeClass('rel')

  render: ->
    @$el.html @template @tplAttrs()
    @postRender()
    @

  postRender: ->
    @$datafield = @$el.find('select')
    @$searchfield = @$el.find('input')
    @$results = @$el.find('.selector-search-results')
    @$options = @$el.find('.selector-options')
    # render selected people

  renderItem: (fragment, model) ->
    item = document.createElement('li')
    item.setAttribute("data-id", model.get("id"))
    if model.get('first_name')
      item.innerHTML = "#{model.get('first_name')} #{model.get('last_name')}"
    else if model.get("label")
      item.innerHTML = model.get("label")
    else
      item.innerHTML = model.id
    fragment.appendChild item

  tplAttrs: ->
    field_name: @field_name
    field_label: @field_label

  # only allow searching every 200ms, for performance
  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @search e.currentTarget.value
  , 200)

  # Calll search on the collection
  search: (query) ->
    if query.length > 0
      @collection.search(query)
    else
      @clearSearchResults()

  # update UI with fresh search results
  updateSearchResults: (query, results) ->
    frag = document.createDocumentFragment()
    @renderItem(frag, person) for person in results.first(4)
    @$results.html frag

  # empty the results list
  clearSearchResults: ->
    @$results.empty()

  selectResult: (event) ->
    id = event.currentTarget.getAttribute('data-id')
    m = @selection.get(id)
    @selection.add {id:id, label: event.currentTarget.innerHTML},
      at: 0
    @resetSearchField()
    @clearSearchResults()


  resetSearchField: -> @$searchfield.val('').focus()

  deselectOption: (event) ->
    id = event.currentTarget.getAttribute('data-id')
    m = @selection.get(id)
    if m && confirm("Deselect #{m.get('label')}?")
      @selection.remove(m)

  updateOptions: (results) ->
    hiddenFrag = document.createDocumentFragment()
    uiFrag = document.createDocumentFragment()
    @selection.each (model) =>
      opt = document.createElement("option")
      opt.setAttribute('selected', true)
      opt.setAttribute('value', model.id)
      hiddenFrag.appendChild opt
      @renderItem(uiFrag, model)

    @$datafield.html hiddenFrag
    @$options.html uiFrag

