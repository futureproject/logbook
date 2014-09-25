dream.Views.Engagements ||= {}

class dream.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'engagement:show', @display
    @listenTo Backbone, 'engagement:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/engagements/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'engagement:edit', @model

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'people:getSome',
      ids: @model.get('attendee_ids')
      callback: @addAttendees

    Backbone.trigger 'router:update', "logbook/engagements/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  hide: ->
    @$el.hide()

  addAttendees: (people) ->
    $('#engagement_attendees').append("<li>#{person.name()}</li>") for person in people

