class dream.TasksPresenter extends Backbone.View
  initialize: ->
    @initRouter()
    @initViews()
    @initCollection()
    @listenTo Backbone, 'tasks:present', @present

  initRouter: -> @router = new dream.Routers.TasksRouter
  initViews: ->
    @views =
      index: dream.Views.Tasks.IndexView
      edit: dream.Views.Tasks.FormView
      new: dream.Views.Tasks.FormView

  initCollection: ->

  present: (view) ->
    new @views[view] if @views[view]?


