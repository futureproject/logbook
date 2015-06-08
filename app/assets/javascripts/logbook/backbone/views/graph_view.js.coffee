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
    @$el.highcharts
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: false
      title: text: 'Browser market shares at a specific website, 2014'
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      plotOptions: pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels:
          enabled: true
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
          style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
      series: [ {
        type: 'pie'
        name: 'Browser share'
        data: [
          [
            'Firefox'
            45.0
          ]
          [
            'IE'
            26.8
          ]
          {
            name: 'Chrome'
            y: 12.8
            sliced: true
            selected: true
          }
          [
            'Safari'
            8.5
          ]
          [
            'Opera'
            6.2
          ]
          [
            'Others'
            0.7
          ]
        ]
      } ]
