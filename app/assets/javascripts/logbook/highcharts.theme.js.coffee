Highcharts.theme =
  colors: [
    '#23323b'
    '#23485d'
    '#3182a2'
    '#7dcadb'
    '#b6dee3'
    '#f9f1de'
    '#a2cfc0'
    '#3d99a0'
    '#3d99a0'
    '#3d99a0'
    '#3d99a0'
    '#3d99a0'
    '#3d99a0'
  ]
  chart:
    backgroundColor: null
    style: fontFamily: 'Avenir Next, Avenir, sans-serif'
  title:
    align: 'left'
    y: 8
    style:
      fontSize: '18px'
      fontWeight: 'bold'
      color: '#5d5c5d'
  tooltip:
    borderWidth: 0
    backgroundColor: 'rgba(255,255,255,0.9)'
    shadow: true
  legend: itemStyle:
    fontWeight: 'bold'
    fontSize: '13px'
  xAxis:
    gridLineWidth: 1
    labels: style: fontSize: '12px'
  yAxis:
    minorTickInterval: 'auto'
    title: style: textTransform: 'uppercase'
    labels: style: fontSize: '12px'
  plotOptions: candlestick: lineColor: '#404048'
  background2: '#F0F0EA'

# Apply the theme
Highcharts.setOptions Highcharts.theme
