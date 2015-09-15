Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceCardView extends Backbone.View
  initialize: ->
    @render()
    @listenTo @model, 'change:attendees', @render

  events:
    'click' : 'showModal'

  template: JST['oldbook/templates/engagements/attendance_card']

  render: ->
    $list = $('<ul class="columned-list" />')
    attendees = @model.get('attendees') || []
    for attendee in attendees
      $list.append "<li class='person-name'>#{attendee.first_name} #{attendee.last_name}</li>"
    @$el.html(@template @model.tplAttrs())
    @$el.append($list)
    @

  showModal: (e) ->
    Backbone.trigger 'engagements:attendance', @model

