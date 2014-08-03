class dream.PeoplePresenter extends Backbone.View
  el: '#logbook_people'

  initialize: (args) ->
    @render()
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'organization'
      label: 'People'
      url: 'logbook/people'
    @initCollection()
    @initViews()
    @listen()

  listen: ->
    @listenTo Backbone, 'people:present', @present
    @listenTo Backbone, 'person:destroy', @destroy

  initCollection: ->
    @collection = new dream.Collections.People

  render: ->
    @$el.html("
      <div id='logbook_people_index' class='list-container'></div>
      <div id='logbook_people_detail' class='detail-container'>
        <div id='logbook_people_show'></div>
        <div id='logbook_people_edit'></div>
        <div id='logbook_people_new'></div>
      </div>
    ")

  present: (url) ->
    @index.render()
    @collection.fetch
      reset: true
      success: () =>
        @collection.syncDirtyAndDestroyed() if navigator.onLine
    @$el.show().siblings().hide()
    Backbone.trigger 'presenter:presenting', @
    Backbone.trigger('router:update', url) if url?

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

  destroy: (model) ->
    model.destroy()
    Backbone.trigger 'router:update', 'logbook/people'
