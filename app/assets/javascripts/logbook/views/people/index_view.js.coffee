dream.Views.People ||= {}

class dream.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @url = args?.url || '/logbook/people'

  el: '#logbook_people_index'

  events:
    'click .list-item': 'showPerson'

  showPerson: (e) ->
    e.preventDefault()
    Backbone.trigger 'router:go', e.currentTarget.pathname
    Backbone.trigger 'people:present', 'show'

  render: () ->
    $.ajax
      url: @url
      headers:
        'X-PJAX': '1'
      complete: (response) =>
        @$el.html(response.responseText)
