class ds.EngagementsController extends ds.BaseController
  el: "#engagements-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "engagements:index", @index
    @listenTo Backbone, "engagements:show", @show
    @listenTo Backbone, "engagements:new", @new
    @listenTo Backbone, "engagements:edit", @edit
    @listenTo Backbone, 'dates:changed', @onDateChange

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
    # check if this is an id or a cid
    uid = if !!parseInt(id) then id else {cid: id}
    engagement = ds.collections.engagements.get(uid)
    engagement = new ds.Engagement({id: id}) unless engagement?
    ds.collections.engagements.add engagement
    engagement.fetch()
    engagement

  onDateChange: ->
    ds.collections.engagements.fetch({ reset: true })
