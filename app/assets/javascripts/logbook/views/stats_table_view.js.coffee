class ds.StatsTableView extends Backgrid.Grid
  initialize: (args) ->
    super
    @listenTo Backbone, 'dates:changed', @setDates
    @data = args.data || {}

  setDates: (dates) ->
    @data[date] = val for date, val of dates
    @spinner = new ds.SpinnerView
    @spinner.$el.insertBefore @$el
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
            @spinner.remove()
            @$el.css('opacity','1')
            @collection.add response.responseJSON, { merge: true}
          error: (e) -> console.log e

