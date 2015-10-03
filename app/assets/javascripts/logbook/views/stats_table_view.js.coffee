class ds.StatsTableView extends Backgrid.Grid
  initialize: (args) ->
    super
    @listenTo Backbone, 'dates:changed', @setDates
    @data = args.data || {}

  setDates: (dates) ->
    @data[date] = val for date, val of dates
    @$el.css('opacity','.25')
    @getStats()

  getStats: ->
    @collection.fetch
      success: =>
        stats_path = @collection.url() + "/stats"
        $.ajax
          dataType: 'json'
          data: @data
          url: stats_path
          complete: (response) =>
            @$el.css('opacity','1')
            @collection.add response.responseJSON, { merge: true}
          error: (e) -> console.log e

