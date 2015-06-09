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
    console.log chart_info
    @$el.empty().highcharts
      colors: chart_info.colors || Highcharts.theme.colors
      credits: false
      chart:
        type: chart_info.type
        backgroundColor: 'transparent'
        zoomType: 'xy'
        height: 360
      title: text: chart_info.title
      #tooltip: pointFormat: '{point.name}: <b>{point.y}</b>'
      xAxis: categories: chart_info.categories
      plotOptions:
        series:
          stacking: true
        bar:
          tooltip: pointFormat: 'Value: <b>{point.y}</b>'
        pie:
          allowPointSelect: true
          cursor: 'pointer'
          tooltip: pointFormat: 'Value: <b>{point.y}</b><br>Percentage: <b>{point.percentage:.1f}%</b>'
          size: '70%'
          dataLabels:
            enabled: true
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
      series: chart_info.data
