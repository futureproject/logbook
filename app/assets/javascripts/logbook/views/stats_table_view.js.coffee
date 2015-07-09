class ds.StatsTableView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection
    @grid = new Backgrid.Grid
      collection: @collection
      columns: @collection.backgrid_columns

  render: ->
    @$el.html @grid.render().el
    @

  getStats: ->
    stats_path = @collection.url() + "/stats"
    $.getJSON stats_path, (response) =>
      @collection.add response, { merge: true}
      @grid.sort("name","ascending")

