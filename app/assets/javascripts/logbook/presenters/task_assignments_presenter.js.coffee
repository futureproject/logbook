class dream.TaskAssignmentsPresenter extends Backbone.View
  initialize: ->
    @initViews()
    @initCollection()
    @listenTo Backbone, 'tasks:present', @present

  initViews: ->
    @views =
      index: dream.Views.Tasks.IndexView
      edit: dream.Views.Tasks.FormView
      new: dream.Views.Tasks.FormView

  initCollection: ->

  present: (view) ->
    new @views[view] if @views[view]?


