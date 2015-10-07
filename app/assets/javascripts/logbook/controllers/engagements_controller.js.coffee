class ds.EngagementsController extends ds.BaseController
  el: "#engagements-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "engagements:index", @index
    @listenTo Backbone, "engagements:show", @show
    @listenTo Backbone, "engagements:new", @new
    @listenTo Backbone, "engagements:edit", @edit

  index: ->
    ds.collectionHelper.bootstrap ds.collections.engagements
    @activate()
    @views.index = new ds.EngagementsIndexView
    @views.index.renderTo @targetEl

  show: (id) ->
    engagement = @setEngagementFromId(id)
    @views.show = new ds.EngagementsShowView
      model: engagement
    @views.show.renderTo @targetEl

  new: (engagement) ->
    engagement = new ds.Engagement
    @views.new = new ds.EngagementsNewView
      model: engagement
    @views.new.renderTo @targetEl

  edit: (id) ->
    engagement = @setEngagementFromId(id)
    @views.edit = new ds.EngagementsEditView
      model: engagement
    @views.edit.renderTo @targetEl

  setEngagementFromId: (id) ->
    @activate()
    # if this is an actual id, not a cid
    if parseInt(id)
      engagement = ds.collections.engagements.get(id) || new ds.Engagement({ id: id })
      engagement.fetch()
    else
      engagement = ds.collections.engagements.get({cid: id}) || new ds.Engagement({ cid: id })
    engagement

