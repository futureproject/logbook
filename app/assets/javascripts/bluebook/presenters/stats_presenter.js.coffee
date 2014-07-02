class Bluebook.StatsPresenter extends Backbone.View
  initialize: (args) ->
    @targetEl = $(args.targetEl)
    @stats = args.stats
    @views =
      index: new Bluebook.Views.Stats.IndexView(el: '#stats', stats: @stats)
    @router = new Bluebook.Routers.StatsRouter
    @listenTo @router, 'route', @show

  events: ->
    click: 'onclick'

  onclick: (e) ->
    return if @$el.hasClass('active')
    @show()
    Backbone.trigger 'statsRouter:go', '/bluebook/', { trigger: true }

  show: ->
    @$el.addClass('active').siblings().removeClass('active')
    @targetEl.show().siblings().hide()
