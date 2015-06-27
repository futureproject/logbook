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
        @setChart(response)
        @render()

  render: ->
    @chart.reflow()

  setChart: (chart_info) ->
    @chart = new Highcharts.Chart
      colors: chart_info.colors || Highcharts.theme.colors
      credits: false
      chart:
        renderTo: @el
        type: chart_info.type
        backgroundColor: 'transparent'
        zoomType: 'xy'
        height: (if chart_info.type.match(/bubble|scatter/) then 420 else 320)
      exporting:
        width: 600
      title: text: chart_info.title
      tooltip: shared: chart_info.type.match(/area/i)
      xAxis:
        categories: chart_info.categories
        type: chart_info.x_axis_type
        title: text: null
        labels: enabled: (if chart_info.type == 'column' then false else true)
      yAxis:
        min: 0
        title: text: null
      plotOptions:
        areaspline:
          marker: enabled: false
          fillOpacity: 1
          stacking: 'normal'
          tooltip:
            pointFormat: '{series.name}: <b>{point.y}</b><br>'
        bar:
          tooltip:
            headerFormat: '{series.name}<br>'
            pointFormat: 'Value: <b>{point.y}</b><br>'
          stacking: (if chart_info.separated then false else true)
        column:
          pointWidth: 10
          tooltip:
            headerFormat: '{series.name}<br>'
            pointFormat: '{point.name}: <b>{point.y}</b><br>'
          events:
            click: (event) ->
              path = "/logbook/" + event.point.url
              path += "?scope_id=" + ds.CONSTANTS.scope.id + "&scope_type=" + ds.CONSTANTS.scope.type
              window.location = path
        pie:
          allowPointSelect: true
          cursor: 'pointer'
          tooltip: pointFormat: 'Value: <b>{point.y}</b><br>Percentage: <b>{point.percentage:.1f}%</b><br>'
          size: '70%'
          dataLabels:
            enabled: true
            format: '<b>{point.name}</b>: {point.percentage:.1f} %<br>'
            style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
        scatter:
          tooltip:
            headerFormat: chart_info.header_format
            pointFormat: chart_info.point_format
          events:
            click: (event) ->
              path = "/logbook/" + event.point.url
              path += "?scope_id=" + ds.CONSTANTS.scope.id + "&scope_type=" + ds.CONSTANTS.scope.type
              window.location = path
        bubble:
          tooltip:
            headerFormat: chart_info.header_format
            pointFormat: chart_info.point_format
          events:
            click: (event) ->
              path = "/logbook/" + event.point.url
              path += "?scope_id=" + ds.CONSTANTS.scope.id + "&scope_type=" + ds.CONSTANTS.scope.type
              window.location = path
      series: chart_info.data
