Phonebook.Views.People ||= {}

class Phonebook.Views.People.AttendingPersonView extends Phonebook.Views.Base.TableItemView
  initialize: ->
    @model ||= new Phonebook.Models.Person
    @listen()

  listen: ->
    @listenTo @, 'tapped', @toggleAttending
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
    Backbone.trigger 'people:search:clear'

  update: ->
    @render()

