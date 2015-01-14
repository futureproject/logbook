Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.SearchResultsView extends Backbone.View
  initialize: ->
    @collection = new Phonebook.Collections.PeopleCollection
    @listen()

  events:
    'tap .add-new-from-search': (e) ->
      console.log @currentQuery
  listen: ->
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'change:attending', @broadcastAttendee
    @listenTo Backbone, 'people:search:started', @onSearchStart
    @listenTo Backbone, 'people:search:complete', @onSearchEnd
    @listenTo Backbone, 'people:search:clear', @resetCollection

  resetCollection: (people) ->
    people ||= []
    @collection.reset people

  render: ->
    markup = @renderAll()
    @$el.html markup
    @showAddButton() if @validQuery()
    @

  renderOne: (person, frag) ->
    frag ||= document.createDocumentFragment()
    v = new Phonebook.Views.People.AttendingPersonView
      model: person
    v.$el.on 'tap', (e) -> Backbone.trigger 'people:search:clear'
    frag.appendChild v.render().el
    frag

  renderAll: (people) ->
    frag = document.createDocumentFragment()
    @renderOne(person, frag) for person in @collection.models
    frag

  showAddButton: ->
    p = new Phonebook.Models.Person
      first_name: @first_name
      last_name: @last_name
      grade: null
    v = new Phonebook.Views.People.CreateablePersonView
      model: p
    @$el.append v.render().el

  validQuery: ->
    return false unless @currentQuery?
    q = @currentQuery.split(" ")
    @first_name = q.shift()
    @last_name= q.join(' ')
    if (@first_name?.length > 0 && @last_name?.length > 0) then true else false

  broadcastAttendee: (person) ->
    Backbone.trigger 'engagement_attendees:updated', person

  onSearchStart: ->
    loader = "<div class='loading'>Loading...</div>"
    return if @$el.text().match(/loading/i)
    @$el.html loader

  onSearchEnd: (data) ->
    @currentQuery = data?.q
    @resetCollection data?.results
