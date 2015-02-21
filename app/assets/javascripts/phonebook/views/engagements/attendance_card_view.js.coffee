Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceCardView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change:attendees', @render

  events:
    'tap' : 'showModal'

  template: JST['phonebook/templates/engagements/attendance_card']

  render: ->
    $list = $('<ul class="columned-list" />')
    attendees = @model.get('attendees')
    for attendee in attendees
      $list.append "<li class='person-name'>#{attendee.first_name} #{attendee.last_name}</li>"
    @$el.html(@template @model.tplAttrs())
    @$el.append($list) unless attendees?.length < 1
    @

  showModal: (e) ->
    Backbone.trigger 'engagements:attendance', @model
    e.gesture.srcEvent.preventDefault()

