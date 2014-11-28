Phonebook.Views.People ||= {}

class Phonebook.Views.People.AttendingPersonView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Person

  render: ->
    @$el.html @template @model.toJSON()
    @

  template: JST['phonebook/templates/people/attending_person']

  className: 'attending-person'


