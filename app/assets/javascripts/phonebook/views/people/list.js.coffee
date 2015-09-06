class ds.PeopleListView extends Backbone.View
  className: 'list people-list'
  events:
    'tap .person': 'itemClick'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  spin: ->
    spinner = new ds.SpinnerView
    @$el.html spinner.render().el

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
    console.log results
    @render({ models: results, length: results.length })
    # split up query by word
    q = query.split(" ")
    last_name= q.pop()
    first_name = q.join(' ')
    validPerson = (first_name?.length > 0 && last_name?.length > 0)
    # if there's a first and last name, let users add a new person
    if validPerson
      @$el.append "<div class='list-item createable'>
          Add &ldquo;#{query}&rdquo;
        </div>"


