ds.Views ||= {}
class ds.Views.SearchView extends Backbone.View
  events:
    'keyup' : 'prepQuery'

  prepQuery: _.debounce((e) ->
    @$t = $(e.currentTarget)
    @q = @$t.val()
    @path = @$t.attr('data-action')
    @search()
  , 200)

  search: ->
    if @q.length > 0
      $.ajax
        url: @path
        dataType: 'json'
        data:
          q: @q
        success: (data, status, xhr) ->
          Backbone.trigger 'search:complete', data
    else
      Backbone.trigger 'search:complete', null

