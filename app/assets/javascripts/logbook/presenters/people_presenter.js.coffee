class dream.PeoplePresenter extends Backbone.View
  el: '#logbook_people'

  initialize: (args) ->
    @render()
    @initTab()
    @initCollection()
    @initViews()
    @listenTo Backbone, 'people:present', @present
    @listenTo Backbone, 'person:destroy', @destroy

  render: ->
    @$el.html("
      <div id='logbook_people_index' class='list-container'></div>
      <div id='logbook_people_detail' class='detail-container'>
        <div id='logbook_people_show'></div>
        <div id='logbook_people_edit'></div>
        <div id='logbook_people_new'></div>
      </div>
    ")

  initTab: ->
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'organization'
      label: 'People'
      url: 'logbook/people'

  initCollection: ->
    @collection = new dream.Collections.People

  initViews: ->
    @index = new dream.Views.People.IndexView
      el: '#logbook_people_index'
      collection: @collection

    @show = new dream.Views.People.ShowView
      el: '#logbook_people_show'

    @edit = new dream.Views.People.EditView
      el: '#logbook_people_edit'

    @new = new dream.Views.People.NewView
      el: '#logbook_people_new'

  present: (url) ->
    return if @$el.is(':visible')
    Backbone.trigger 'presenter:presenting', @
    @index.render()
    @collection.fetch
      reset: true
      remote: false
      success: =>
        return if @collection.autoRefreshed
        @collection.refresh()
        @collection.autoRefreshed = true

    @$el.show().siblings().hide()
    Backbone.trigger('router:update', url) if url?

  destroy: (model) ->
    model.destroy()
    Backbone.trigger 'router:update', 'logbook/people'
