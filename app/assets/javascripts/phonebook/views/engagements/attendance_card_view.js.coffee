Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceCardView extends Backbone.View
  events:
    'tap' : 'showModal'

  render: ->
    $list = $('<ul class="columned-list" />')
    attendees = @model.get('attendees')
    return unless attendees?.length > 0
    for attendee in attendees
      $list.append "<li>#{attendee.first_name} #{attendee.last_name}</li>"
    @$el.append $list
    @

  showModal: (e) ->
    Backbone.trigger 'engagements:attendance', @model
    e.gesture.srcEvent.preventDefault()
