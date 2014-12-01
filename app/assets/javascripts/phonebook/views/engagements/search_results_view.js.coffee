Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.SearchResultsView extends Backbone.View
  initialize: ->
    @collection = new Phonebook.Collections.PeopleCollection
    @listen()

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

  broadcastAttendee: (person) ->
    Backbone.trigger 'engagement_attendees:updated', person

  onSearchStart: ->
    loader = "<div class='loading'>Loading...</div>"
    return if @$el.text().match(/loading/i)
    @$el.html loader

  onSearchEnd: (data) ->
    @resetCollection data?.results
