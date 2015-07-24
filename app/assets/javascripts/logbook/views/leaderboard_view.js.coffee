class ds.LeaderboardView extends Backbone.View
  className: 'three-col'
  initialize: (args) ->
    @url = args.url
    @listenTo Backbone, 'dates:changed', @render

  events:
    'click a': 'linkToProfile'

  render: ->
    @$el.html "<div class='loading'></div>"
    $.getJSON @url, (res) =>
      @$el.empty()
      _.each res, (array, key) => @addList(array, key)

  addList: (list, list_name) =>
    $elem = $("<ul />")
    _.each list, (item) ->
      $elem.append "<li>#{item.stat} - #{item.name}</li>"
    $elem.prepend("<li><label>#{list_name.replace(/\_/ig,' ')}</label></li>")
    $elem.append "<li>No Results</li>" if list.length == 0
    @$el.append $elem

  linkToProfile: (event) ->
    #etc

