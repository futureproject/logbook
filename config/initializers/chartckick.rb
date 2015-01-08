Chartkick.options = {
  colors: %w(#42C6EE #5C6788 #B363A3 #9C3030 #4D4A49 #76EE42 #6D21BB #5C886A #7FC9F0 #BBA721 #164969),
  library: {
    chart: {
      backgroundColor: "#fdfcfd",
      zoomType: 'xy'
    },
    plotOptions: {
      series: {
        #fillOpacity: 1,
        stacking: false
      },
    },
    tooltip: {
      shared: true,
      pointFormat: '{series.name}: <b>{point.y}</b><br>',
      xDateFormat: '%B %d'
    },
  }
}
