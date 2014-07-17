class dream.WorkshopsPresenter extends Backbone.View
  initialize: ->
    @initRouter()
    @initViews()
    @initCollection()
    @listenTo Backbone, 'workshops:present', @present

  initRouter: -> @router = new dream.Routers.WorkshopsRouter
  initViews: ->
    @views =
      index: dream.Views.Workshops.IndexView
      edit: dream.Views.Workshops.FormView
      new: dream.Views.Workshops.FormView

  initCollection: ->

  present: (view) ->
    new @views[view] if @views[view]?


