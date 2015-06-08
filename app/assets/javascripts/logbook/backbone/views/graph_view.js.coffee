window.ds ||= {}

class ds.GraphView extends Backbone.View
  initialize: (args) ->
    return unless args?.url
    @url = args.url
    @load()

  load: ->
    $.ajax
      dataType: 'json'
      url: @url
      success: (response) =>
        @render(response)

  render: (chart_info) ->
    @$el.empty().highcharts
      credits: false
      chart:
        backgroundColor: 'transparent'
      title: null
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      plotOptions:
        pie:
          allowPointSelect: true
          cursor: 'pointer'
          dataLabels:
            enabled: true
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
      series: [ {
        type: chart_info.type
        data: chart_info.data
      } ]
