class dream.ProjectsPresenter extends Backbone.View
  el: '#logbook_projects'

  initialize: (args) ->
    @render()
    @initTab()
    @initCollection()
    @initViews()
    @listenTo Backbone, 'projects:present', @present
    @listenTo Backbone, 'project:destroy', @destroy

  render: ->
    @$el.html("
      <div id='logbook_projects_index' class='list-container'></div>
      <div id='logbook_projects_detail' class='detail-container'>
        <div id='logbook_projects_show'></div>
        <div id='logbook_projects_edit'></div>
        <div id='logbook_projects_new'></div>
      </div>
    ")

  initTab: ->
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'paintcan'
      label: 'Projects'
      url: 'logbook/projects'

  initCollection: ->
    @collection = new dream.Collections.Projects

  initViews: ->
    @index = new dream.Views.Projects.IndexView
      el: '#logbook_projects_index'
      collection: @collection

    @show = new dream.Views.Projects.ShowView
      el: '#logbook_projects_show'

    @edit = new dream.Views.Projects.EditView
      el: '#logbook_projects_edit'

    @new = new dream.Views.Projects.NewView
      el: '#logbook_projects_new'

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
    Backbone.trigger 'router:update', 'logbook/projects'
