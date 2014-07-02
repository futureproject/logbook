class Bluebook.StatsPresenter extends Backbone.View
  initialize: (args) ->
    @targetEl = $(args.targetEl)
    @stats = args.stats
    @views =
      index: new Bluebook.Views.Stats.IndexView(el: '#stats', stats: @stats)
    @router = new Bluebook.Routers.StatsRouter
    @listenToOnce @router, 'route', @show

  events: ->
    click: 'onclick'

  onclick: (e) ->
    @show() unless @$el.hasClass('active')

  show: ->
    Backbone.trigger 'statsRouter:go', '/bluebook/', { trigger: true }
    @$el.addClass('active').siblings().removeClass('active')
    @targetEl.show().siblings().hide()
