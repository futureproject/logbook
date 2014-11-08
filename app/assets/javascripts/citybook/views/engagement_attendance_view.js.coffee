ds.Views ||= {}

class ds.Views.EngagementAttendanceView extends Backbone.View
  events:
    'click .mark-as-present': 'attended'

  attended: (e) ->
    person_id = e.currentTarget.getAttribute('data-id')
    engagement_id = window.DS_DATA.engagement_id
    engagement_data = {
      engagement_attendee:
        person_id: person_id
        engagement_id: engagement_id
    }
    $.ajax
      type: 'POST'
      url: '/api/v1/engagement_attendees.json'
      dataType: 'json'
      data: engagement_data
      success: (data, status, xhr) =>
        Backbone.trigger 'search:clear'
        count = parseInt($('#attendee_count').text())
        count += 1
        $('#attendee_count').text(count)
      error: (response) ->
        if response.responseJSON.person_id?
          alert("That person has already been marked present.")
        else
          alert("error: #{response.responseText}")


  onError: (event, response, status) ->
    alert response.responseText
