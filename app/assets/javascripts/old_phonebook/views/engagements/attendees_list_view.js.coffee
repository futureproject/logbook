Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendeesListView extends Backbone.View
  initialize: ->
    @collection = new Phonebook.Collections.PeopleCollection
    @listen()

  listen: ->
    @listenTo Backbone, 'engagement_attendees:loaded', @resetCollection
    @listenTo Backbone, 'engagement_attendees:updated', @addOrRemove
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'change:attending add', @broadcast

  resetCollection: (people) ->
    (person.attending = 'Present') for person in people
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

  addOrRemove: (person) ->
    @collection.remove person
    @collection.add person,
      merge: true
      at: 0
    @render()

  broadcast: ->
    attending = @collection.where({attending: 'Present'})
    ids = _.pluck attending, 'id'
    Backbone.trigger 'engagements:attendee_ids', ids

