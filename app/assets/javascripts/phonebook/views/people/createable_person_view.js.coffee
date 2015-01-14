Phonebook.Views.People ||= {}

class Phonebook.Views.People.CreateablePersonView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Person
    @listen()

  events:
    'tap': 'toggleAttending'

  listen: ->
    @listenTo Backbone, 'attendees:clean', @remove
    @listenTo @model, 'change:attending', @update

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  template: JST['phonebook/templates/people/createable_person']

  className: 'list-item attending-person'

  toggleAttending: ->
# TODO
  update: ->
    @render()
    Backbone.trigger 'engagements:attendee_changed', @model

