ds.Views ||= {}
class ds.Views.SearchView extends Backbone.View
  initialize: ->
    return unless @el?
    @listenTo Backbone, 'search:clear', =>
      @$el.val('')
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
        success: (data, status, xhr) =>
          Backbone.trigger 'search:complete',
            q: @q
            results: data
    else
      Backbone.trigger 'search:clear'

