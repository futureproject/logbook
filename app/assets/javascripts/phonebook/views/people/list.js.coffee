class ds.PeopleListView extends Backbone.View
  className: 'list people-list'
  events:
    'tap .list-item': 'itemClick'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  render: (collection) ->
    collection ||= @collection
    console.log "rendered list with #{@collection.length} people"
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
    @listenTo Backbone, "people:search:results", (results) => @render(results)
    @listenTo Backbone, "people:search:cancelled", @render
    @listenTo @collection, "reset", @render

  itemClick: (event) ->
    el = event.currentTarget
    $(el).addClass('active').siblings().removeClass('active')
    event.currentTarget.innerHTML += "!"

