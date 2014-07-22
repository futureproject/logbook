class dream.ProjectsPresenter extends Backbone.View
  initialize: ->
    @initRouter()
    @initViews()
    @initCollection()
    @listenTo Backbone, 'projects:present', @present

  initRouter: -> @router = new dream.Routers.ProjectsRouter
  initViews: ->
    @views =
      index: dream.Views.Projects.IndexView
      edit: dream.Views.Projects.FormView
      new: dream.Views.Projects.FormView

  initCollection: ->

  present: (view) ->
    new @views[view] if @views[view]?


