Phonebook.Views.People ||= {}

class Phonebook.Views.People.AttendingPersonView extends Backbone.View
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

  template: JST['phonebook/templates/people/attending_person']

  className: 'list-item attending-person'

  toggleAttending: ->
    if @model.has 'attending'
      @model.set 'attending', null
    else
      @model.set 'attending', 'Present'

  update: ->
    @render()
    Backbone.trigger 'engagements:attendee_changed', @model

