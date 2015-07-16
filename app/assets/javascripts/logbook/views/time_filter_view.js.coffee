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
    $.ajaxPrefilter (options, originalOptions, jqXHR) =>
      options.data = @datesAsParams(options.data)
      true

  el: "#time-filter-menu"
  events:
    'change': 'onchange'

  onchange: (event) ->
    range = @$el.val()
    dates = @options[range]
    @dates =
      t_start: dates[0].toJSON()
      t_end: dates[1].toJSON()
    Backbone.trigger 'dates:changed'

  datesAsParams: (data) ->
    data ||= {}
    data = _.extend data, @dates
    $.param(data)

  subtractDays: (date, numDays) ->
    d = new Date()
    d.setTime(date.getTime())
    d.setDate(d.getDate() - numDays)
    d

