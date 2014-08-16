class dream.WorkshopsPresenter extends Backbone.View
  el: '#logbook_workshops'

  initialize: (args) ->
    @render()
    @initTab()
    @initCollection()
    @initViews()
    @listenTo Backbone, 'workshops:present', @present
    @listenTo Backbone, 'workshop:destroy', @destroy

  render: ->
    @$el.html("
      <div id='logbook_workshops_index' class='list-container'></div>
      <div id='logbook_workshops_detail' class='detail-container'>
        <div id='logbook_workshops_show'></div>
        <div id='logbook_workshops_edit'></div>
        <div id='logbook_workshops_new'></div>
      </div>
    ")

  initTab: ->
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'podium'
      label: 'Workshops'
      url: 'logbook/workshops'

  initCollection: ->
    @collection = new dream.Collections.Workshops

  initViews: ->
    @index = new dream.Views.Workshops.IndexView
      el: '#logbook_workshops_index'
      collection: @collection

    @show = new dream.Views.Workshops.ShowView
      el: '#logbook_workshops_show'

    @edit = new dream.Views.Workshops.EditView
      el: '#logbook_workshops_edit'

    @new = new dream.Views.Workshops.NewView
      el: '#logbook_workshops_new'

  present: (url) ->
    return if @$el.is(':visible')
    Backbone.trigger 'presenter:presenting', @
    @index.render()
    @collection.bootstrap()
    @$el.show().siblings().hide()
    Backbone.trigger('router:update', url) if url?

  destroy: (model) ->
    model.destroy()
    Backbone.trigger 'router:update', 'logbook/workshops'
