dream.Views.Workshops ||= {}

class dream.Views.Workshops.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'workshop:show', @display
    @listenTo Backbone, 'workshop:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/workshops/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'workshop:edit', @model

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'people:getSome',
      ids: @model.get('attendee_ids')
      callback: @addAttendees

    Backbone.trigger 'router:update', "logbook/workshops/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  hide: ->
    @$el.hide()

  addAttendees: (people) ->
    $('#workshop_attendees').append("<li>#{person.name()}</li>") for person in people

