class ds.PeopleListView extends Backbone.View
  className: 'list people-list'
  events:
    'touchstart .list-item': 'ontouchstart'
    'click .person': 'itemClick'
    'click .createable': 'addPerson'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  render: (collection) ->
    collection ||= @collection
    console.log "rendered list with #{collection.length} people"
    fragment = document.createDocumentFragment()
    for person in collection.models
      item = document.createElement("div")
      item.className = "list-item person"
      item.setAttribute("data-id", person.get("id"))
      item.innerHTML = "#{person.get('first_name')} #{person.get('last_name')}"
      fragment.appendChild item
    @$el.html(fragment)
    @

  listen: ->
    @listenTo Backbone, "people:search:results", @onSearch
    @listenTo Backbone, "people:search:cancelled", @render
    @listenTo @collection, "reset", @render

  itemClick: (event) ->
    el = event.currentTarget
    id = el.getAttribute('data-id')
    $(el).addClass('active').siblings().removeClass('active')
    Backbone.trigger "people:do", "show", id

  onSearch: (query, results) ->
    @render({ models: results, length: results.length })
    # split up query by word
    q = query.split(" ")
    last_name= q.pop()
    first_name = q.join(' ')
    validPerson = (first_name?.length > 0 && last_name?.length > 0)
    # if there's a first and last name, let users add a new person
    if validPerson
      @$el.append "<div class='list-item createable' data-first='#{first_name}' data-last='#{last_name}'>
          Add &ldquo;#{query}&rdquo;
        </div>"

  addPerson: (event) ->
    # get first and last names
    first = event.currentTarget.getAttribute('data-first')
    last = event.currentTarget.getAttribute('data-last')
      # titlecase names if they start with lowercase letters
    first = first.toTitleCase() if first.match(/\b[a-z]/)
    last = last.toTitleCase() if last.match(/\b[a-z]/)
      # add a new Person to the collection
    person = new ds.Person
      first_name: first,
      last_name: last
    @collection.create person,
      at: 0
      # set course for the Person Show page and engage at maximum warp
    Backbone.trigger "people:do", "show", person.cid


  ontouchstart: ->
