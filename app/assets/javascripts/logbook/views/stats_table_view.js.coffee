class ds.StatsTableView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection
    @grid = new Backgrid.Grid
      collection: @collection
      columns: @collection.backgrid_columns

  render: ->
    @$el.empty().append(@grid.render().el)
    @

  getStats: ->
    @collection.fetch
      success: =>
        stats_path = @collection.url() + "/stats"
        $.getJSON stats_path, (response) =>
          @collection.add response, { merge: true}
          @grid.sort("name","ascending")

