class ds.GraphsController extends Backbone.View
  initialize: ->
    graphs = []
    $('.graph').each ->
      graph = new ds.GraphView
        url: this.getAttribute('data-url')
        el: this
      graphs.push graph
    if window.matchMedia?
      mq = window.matchMedia('print')
      mq.addListener ->
        $('body').toggleClass('print', mq.matches)
        graph.chart.reflow() for graph in graphs

