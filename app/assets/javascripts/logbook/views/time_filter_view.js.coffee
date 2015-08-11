class ds.TimeFilterView extends Backbone.View
  initialize: ->
    @now = new Date()
    @beginning_of_school_year = new Date(ds.CONSTANTS.beginning_of_school_year)
    @options =
      'this_school_year': [@beginning_of_school_year, @now]
      'past_two_weeks': [@subtractDays(@now, 14), @now]
      'past_month': [@subtractDays(@now, 30), @now]
      'past_three_months': [@subtractDays(@now, 90), @now]
      'this_time_last_year': [@subtractDays(@beginning_of_school_year, 365), @subtractDays(@now, 365)]
      'dawn_of_time': [new Date(2014,7,24), @now]

    @dates = {}
    # add date params to all AJAX GET requests
    $.ajaxPrefilter (options, originalOptions, jqXHR) =>
      return true unless options.type.match(/get/i)
      options.data = @addDatesToParams(originalOptions.data)
      true

  el: "#time-filter-menu"
  events:
    'change': 'onchange'

  onchange: (event) ->
    range = @$el.val()
    dates = @options[range]
    @dates =
      t_start: Date.parse(dates[0]).toString('yyyy-MM-dd')
      t_end: Date.parse(dates[1]).toString('yyyy-MM-dd')
    Backbone.trigger 'dates:changed'

  addDatesToParams: (data_params) ->
    switch typeof(data_params)
      when "string"
        data_params = $.extend JSON.parse(data_params), @dates
      when "object", "array"
        data_params = $.extend data_params, @dates
      else
        data_params = @dates
    $.param data_params

  subtractDays: (date, numDays) ->
    d = new Date()
    d.setTime(date.getTime())
    d.setDate(d.getDate() - numDays)
    d

