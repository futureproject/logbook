class ds.StatsTableView extends Backgrid.Grid
  initialize: ->
    super
    @listenTo Backbone, 'dates:changed', @getStats

  getStats: ->
    @collection.fetch
      success: =>
        stats_path = @collection.url() + "/stats"
        $.getJSON stats_path, (response) =>
          @collection.add response, { merge: true}

  loadNextPage: (e) ->
    return unless @collection.state?
    @collection.setPageSize @collection.state.pageSize + 50
