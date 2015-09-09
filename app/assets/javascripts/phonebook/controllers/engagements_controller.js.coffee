class ds.EngagementsController extends Backbone.View
  el: "#phonebook"
  initialize: ->
    @views = {}
    @collection = new ds.EngagementsCollection
    @listenTo Backbone, "engagements:do", @do
    @listenTo Backbone, "people:do", @hideAll

  do: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  new: (id) ->
    ds.router.navigate "phonebook/engagements/new/#{id}"
    ids = [id]
    if ds.user.current()?.get('role').match(/volunteer|student|APR/i)
      ids.push ds.user.current().id
    engagement = new ds.Engagement
      attendee_ids: [ids]
    @views.new = new ds.EngagementsNewView
      model: engagement
    @views.new.renderTo @el

  hideAll: ->
    _.each @views, (view) -> view.hide()
