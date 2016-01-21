class ds.PeopleListView extends Backbone.View
  className: 'list people-list'
  events:
    'click .person': 'itemClick'
    'click .createable': 'addPerson'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  render: (collection) ->
    collection ||= @collection
    console.log "rendered list with #{collection.length} people"
    fragment = document.createDocumentFragment()
    for person in collection.first(50)
      item = document.createElement("div")
      item.className = "list-item person"
      item.setAttribute("data-id", person.get("id"))
      if person.get('avatar_url')
        h = "<img src='#{person.get('avatar_url')}' alt='#{person.get('first_name')}' />"
      else
        h = "<div class='initials'>#{ person.get('initials')}</div>"
      h += "#{person.get('first_name')} #{person.get('last_name')}"
      item.innerHTML = h
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
    Backbone.trigger "people:action", "show", id

  onSearch: (query, results) ->
    @render(results)
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
    Backbone.trigger "people:action", "show", person.cid
