class ds.PeopleLeaderboardView extends Backbone.View
  className: 'three-col'
  initialize: (args) ->
    @url = args.url

  render: ->
    $.getJSON @url, (res) =>
      _.each res, (array, key) => @addList(array, key)

  addList: (list, list_name) =>
    $elem = $("<ul />")
    _.each list, (item) ->
      $elem.append "<li>#{item.first_name} #{item.last_name} - #{item.stat} #{item.unit}</li>"
    $elem.prepend("<li><label>#{list_name.replace('_',' ')}</label></li>")
    @$el.append $elem

