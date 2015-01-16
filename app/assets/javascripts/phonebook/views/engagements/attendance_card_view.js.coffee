Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceCardView extends Backbone.View
  initialize: ->

  render: ->
    $list = $('<ul class="columned-list" />')
    attendees = @model.get('attendees')
    return unless attendees?.length > 0
    for attendee in @model.get('attendees')
      $list.append "<li>#{attendee.first_name} #{attendee.last_name}</li>"
    @$el.append $list
    @
