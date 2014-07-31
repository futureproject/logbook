class dream.StatsPresenter extends Backbone.View
  initialize: (args) ->
    @render()
    @initViews()
    @initCollection()
    @listenTo Backbone, 'stats:present', @present

  el: '#logbook_people'

  initViews: ->
    @views =
      index: dream.Views.People.IndexView
      show: dream.Views.People.ShowView
      edit: dream.Views.People.FormView
      new: dream.Views.People.FormView

  initCollection: ->

  present: (view, args) ->
    Backbone.trigger 'presenter:presenting', 'stats'
    @$el.show().siblings().hide()
    if @views[view]?
      v = new @views[view]
      v.render()


