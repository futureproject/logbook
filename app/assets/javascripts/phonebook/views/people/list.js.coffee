class ds.PeopleListView extends Backbone.View
  className: 'list people-list'
  events:
    'tap .list-item': 'itemClick'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  spin: ->
    spinner = new ds.SpinnerView
    @$el.html spinner.render().el

  render: (collection) ->
    collection ||= @collection
    if collection.length > 0
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
    else
      @spin()

  listen: ->
    @listenTo Backbone, "people:search:results", (results) => @render({models: results, length: 10})
    @listenTo Backbone, "people:search:cancelled", @render
    @listenTo @collection, "reset", @render

  itemClick: (event) ->
    el = event.currentTarget
    id = el.getAttribute('data-id')
    $(el).addClass('active').siblings().removeClass('active')
    Backbone.trigger "people:do", "show", id

