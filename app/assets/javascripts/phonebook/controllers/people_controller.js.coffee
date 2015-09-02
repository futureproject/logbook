class ds.PeopleController extends Backbone.View
  initialize: ->
    @views = {}
    @listenTo Backbone, "people:do", @do

  do: (fn, args) ->
    # hide all open views
    _.each @views, (view) -> view.hide()

    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  index: ->
    @views.index = new ds.PeopleIndexView
    @views.index.renderTo "#phonebook"
