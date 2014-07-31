dream.Views.People ||= {}

class dream.Views.People.ShowView extends Backbone.View
  el: '#logbook_people_show'
  render: ->
    $.ajax
      url: location.pathname
      headers:
        'X-PJAX': '1'
      complete: (response) =>
        @$el.html(response.responseText)
