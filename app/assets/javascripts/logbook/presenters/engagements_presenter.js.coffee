class dream.EngagementsPresenter extends Backbone.View
  el: '#logbook_engagements'

  initialize: (args) ->
    @render()
    @initTab()
    @initCollection()
    @initViews()
    @listenTo Backbone, 'engagements:present', @present
    @listenTo Backbone, 'engagement:destroy', @destroy
    @listenTo Backbone, 'engagement:clone', @clone

  render: ->
    @$el.html("
      <div id='logbook_engagements_index' class='list-container'></div>
      <div id='logbook_engagements_detail' class='detail-container'>
        <div id='logbook_engagements_show'></div>
        <div id='logbook_engagements_edit'></div>
        <div id='logbook_engagements_new'></div>
      </div>
    ")

  initTab: ->
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'pulse'
      label: 'Engagements'
      url: 'logbook/engagements'

  initCollection: ->
    @collection = new dream.Collections.Engagements

  initViews: ->
    @index = new dream.Views.Engagements.IndexView
      el: '#logbook_engagements_index'
      collection: @collection

    @show = new dream.Views.Engagements.ShowView
      el: '#logbook_engagements_show'

    @edit = new dream.Views.Engagements.EditView
      el: '#logbook_engagements_edit'

    @new = new dream.Views.Engagements.NewView
      el: '#logbook_engagements_new'

  present: (url) ->
    return if @$el.is(':visible')
    Backbone.trigger 'presenter:presenting', @
    @index.render()
    @collection.bootstrap()
    @$el.show().siblings().hide()
    Backbone.trigger('router:update', url) if url?

  destroy: (model) ->
    model.destroy()
    Backbone.trigger 'router:update', 'logbook/engagements'

  clone: (model) ->
    data = _.omit(model.attributes, 'id')
    data.date = Date.parse('today').toString('yyyy-MM-dd')
    data.attendee_ids = [''] if data.attendee_ids == null
    cloned_engagement = new dream.Models.Engagement
    cloned_engagement.save data,
      success: (engagement) ->
        Backbone.trigger 'engagement:created', engagement
        Backbone.trigger 'engagement:show', engagement
      error: (e) =>
        console.log e
