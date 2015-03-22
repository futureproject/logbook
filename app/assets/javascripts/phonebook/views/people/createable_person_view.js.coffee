Phonebook.Views.People ||= {}

class Phonebook.Views.People.CreateablePersonView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Person
    @createable = true
    @listen()

  events:
    'click': 'create'

  listen: ->
    @listenTo Backbone, 'engagements:attendee_ids', @remove

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  template: JST['phonebook/templates/people/createable_person']

  className: 'row attending-person'

  create: ->
    return unless @createable
    @creatable = false
    @model.save { attending: 'Present'},
      success: =>
        @remove()
        Backbone.trigger 'engagement_attendees:updated', @model
        Backbone.trigger 'people:search:clear'
      error: => @createable = true
