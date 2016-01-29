class ds.EngagementsController extends Backbone.View
  initialize: ->
    @views = {}
    @collection = ds.collections.engagements
    @listenTo Backbone, "engagements:action", @action

  action: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)
    # reset the scroll position of the body
    Backbone.trigger 'app:resetScroll'

  new: ->
    ds.router.navigate "phonebook/engagements/new"
    engagement = new ds.Engagement
      school_id: ds.CURRENT_USER.get('school_id')
    @views.new = new ds.EngagementNewView
      model: engagement
    @views.new.renderTo ds.views.app.el

  show: (id) ->
    ds.router.navigate "phonebook/engagements/#{id}"
    engagement = @getModelFromId(id)
    @views.show = new ds.EngagementShowView
      model: engagement
    @views.show.renderTo ds.views.app.el

  getModelFromId: (id) ->
    # if this is an actual id, not a cid
    if parseInt(id)
      model = @collection.get(id) || new ds.Engagement({ id: id })
      model.fetch {success: => @collection.add model}
    else
      model = @collection.get({cid: id}) || new ds.Engagement({ cid: id })
    model
