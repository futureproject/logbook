class ds.PeopleLeaderboardView extends Backbone.View
  className: 'three-col'
  initialize: (args) ->
    @url = args.url
    @listenTo Backbone, 'dates:changed', @render

  render: ->
    @$el.html "<div class='loading'></div>"
    $.getJSON @url, (res) =>
      @$el.empty()
      _.each res, (array, key) => @addList(array, key)

  addList: (list, list_name) =>
    $elem = $("<ul />")
    _.each list, (item) ->
      $elem.append "<li>#{item.stat} - #{item.first_name} #{item.last_name}</li>"
    $elem.prepend("<li><label>#{list_name.replace(/\_/ig,' ')}</label></li>")
    @$el.append $elem

