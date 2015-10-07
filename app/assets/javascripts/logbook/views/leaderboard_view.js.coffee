class ds.LeaderboardView extends Backbone.View
  className: 'three-col'
  initialize: (args) ->
    throw "ds.LeaderboardView needs a URL argument" unless args?.url
    @url = args.url
    @listenTo Backbone, 'filters:apply', @applyFilters
    @data = {}

  render: ->
    @$el.html "<div class='lb-loading'></div>"
    $.ajax
      dataType: 'json'
      data: @data
      url: @url
      complete: (response) =>
        res = response.responseJSON
        @state = res.state
        @$el.empty()
        _.each res.data, (array, key) => @addList(array, key)

  addList: (list, list_name) =>
    $elem = $("<ul />")
    _.each list, (item) =>
      $elem.append "<li>#{item.stat} - <a href='/logbook/#{@state.namespace}/#{item.id}'>#{item.name}</a></li>"
    $elem.prepend("<li><label>#{list_name.replace(/\_/ig,' ')}</label></li>")
    $elem.append "<li>No Results</li>" if list.length == 0
    @$el.append $elem

  applyFilters: (namespace, filters) ->
    @data[k] = v for k,v of filters
    @render()
