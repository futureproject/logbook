Phonebook.Views.People ||= {}

class Phonebook.Views.People.SearchView extends Backbone.View
  initialize: (args) ->
    @url = args?.url
    throw 'SearchView needs a url to search' unless @url
    @listenTo Backbone, 'people:search:clear', @reset

  events:
    'keyup' : 'throttledSearch'

  reset: ->
    @$el.val('')

  throttledSearch: _.debounce((e) ->
    return if e.keyCode? && e.keyCode == 13 #don't listen to the enter key!
    @q = @$el.val()
    @search()
  , 200)

  search: ->
    Backbone.trigger 'people:search:started'
    if @q.length > 0
      $.ajax
        url: @url
        dataType: 'json'
        data:
          q: @q
        success: (data, status, xhr) =>
          Backbone.trigger 'people:search:complete',
            q: @q
            results: data
    else
      Backbone.trigger 'people:search:clear'

