Chartkick.options = {
  colors: %w(#23323b #23485d #3182a2 #7dcadb #b6dee3 #f9f1de #a2cfc0 #3d99a0 #3d99a0 #3d99a0 #3d99a0 #3d99a0 #3d99a0),
  library: {
    chart: {
      backgroundColor: "#f6f7f8",
      zoomType: 'xy'
    },
    plotOptions: {
      series: {
        fillOpacity: "0.6",
        stacking: false,
        lineWidth: 3
      },
    },
    tooltip: {
      shared: true,
      pointFormat: '{series.name}: <b>{point.y}</b><br>',
      xDateFormat: '%B %d'
    },
  }
}
