ds.Views ||= {}

class ds.Views.NewPersonViaSearchView extends Backbone.View
  initialize: (args)->
    return unless @el?
    @listenTo Backbone, 'search:complete', @show
    @listenTo Backbone, 'search:clear', @hide
    @$inputs = @$el.find('.new-record-via-search')
    @defaultHtml = @$inputs.html()

  events:
    'ajax:success': 'created'
    'ajax:error': 'onError'
    'click .mark-as-present': 'attended'

  show: (search) ->
    @$inputs.html @defaultHtml
    full_name = search.q.split(' ')
    last = full_name.pop()
    first = full_name.join(' ')
    @$inputs.show().find('.person-name').text(search.q)
    @$inputs.find('#person_first_name').val(first)
    @$inputs.find('#person_last_name').val(last)

  hide: ->
    @$inputs.hide()

  created: (event, response, status) ->
    @$inputs.html ('<tr><td colspan=5>Person added!</td></tr>')
    Backbone.trigger 'search:added',
      response

  onError: (event, response, status) ->
    alert response.responseText

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
        alert "Person added!"
