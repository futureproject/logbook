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
    frag.appendChild v.render().el
    frag

  renderAll: (people) ->
    frag = document.createDocumentFragment()
    @renderOne(person, frag) for person in @collection.models
    frag

  showAddButton: (q) ->
    personAttrs = @validateQuery(q)
    return unless personAttrs
    personAttrs.grade = null
    p = new Phonebook.Models.Person personAttrs
    v = new Phonebook.Views.People.CreateablePersonView
      model: p
    @$el.append v.render().el

  validateQuery: (q) ->
    return false unless q?
    q = q.split(" ")
    first_name = q.shift()
    last_name= q.join(' ')
    if (first_name?.length > 0 && last_name?.length > 0)
      { first_name: first_name, last_name: last_name, name: first_name + " " + last_name }
    else
      false

  broadcastAttendee: (person) ->
    Backbone.trigger 'engagement_attendees:updated', person

  onSearchStart: ->
    loader = "<div class='lb-loading'>Loading...</div>"
    return if @$el.text().match(/loading/i)
    @$el.html loader

  onSearchEnd: (data) ->
    @resetCollection data?.results
    @showAddButton data?.q
