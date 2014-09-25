class dream.EngagementsPresenter extends Backbone.View
  initialize: ->
    @initRouter()
    @initViews()
    @initCollection()
    @listenTo Backbone, 'engagements:present', @present

  initRouter: -> @router = new dream.Routers.EngagementsRouter
  initViews: ->
    @views =
      index: dream.Views.Engagements.IndexView
      edit: dream.Views.Engagements.FormView
      new: dream.Views.Engagements.FormView

  initCollection: ->

  present: (view) ->
    new @views[view] if @views[view]?


