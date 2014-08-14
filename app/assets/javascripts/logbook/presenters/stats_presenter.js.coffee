class dream.StatsPresenter extends Backbone.View
  el: '#logbook_stats'

  initialize: (args) ->
    @initTab()
    @initCollection()
    @initViews()
    @listenTo Backbone, 'stats:present', @present

  initTab: ->
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'pulse'
      label: 'Stats'
      url: 'logbook/stats'

  initCollection: ->
    @collection = new dream.Collections.Stats

  initViews: ->
    @index = new dream.Views.Stats.IndexView
      el: '#logbook_stats'
      collection: @collection

  present: (url) ->
    return if @$el.is(':visible')
    Backbone.trigger 'presenter:presenting', @
    @index.render()
    @$el.show().siblings().hide()
    Backbone.trigger('router:update', url) if url?

