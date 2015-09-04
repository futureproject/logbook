class ds.PeopleListView extends Backbone.View
  className: 'list people-list'

  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  render: (models=@collection.models) ->
    console.log 'rendered list!'
    fragment = document.createDocumentFragment()
    for person in models
      item = document.createElement("div")
      item.className = "list-item person"
      item.innerHTML = "<a href='/phonebook/people/#{person.get('id')}'>#{person.get('first_name')} #{person.get('last_name')}</a>"
      fragment.appendChild item
    @$el.html(fragment)
    @

  listen: ->
    @listenTo Backbone, "people:search:results", (results) => @render(results)
    @listenTo Backbone, "people:search:cancelled", @render


