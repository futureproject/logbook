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

