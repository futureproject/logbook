class ds.ProjectsController extends ds.BaseController
  el: "#projects-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "projects:index", @index
    @listenTo Backbone, "projects:show", @show
    @listenTo Backbone, "projects:new", @new
    @listenTo Backbone, "projects:edit", @edit

  index: ->
    ds.collectionHelper.bootstrap ds.collections.projects
    @activate()
    @views.index = new ds.ProjectsIndexView
    @views.index.renderTo @targetEl

  show: (id) ->
    project = @setProjectFromId(id)
    @views.show = new ds.ProjectsShowView
      model: project
    @views.show.renderTo @targetEl

  new: (project) ->
    project = new ds.Project
    @views.new = new ds.ProjectsNewView
      model: project
    @views.new.renderTo @targetEl

  edit: (id) ->
    project = @setProjectFromId(id)
    @views.edit = new ds.ProjectsEditView
      model: project
    @views.edit.renderTo @targetEl

  setProjectFromId: (id) ->
    @activate()
    # if this is an actual id, not a cid
    if parseInt(id)
      project = ds.collections.projects.get(id) || new ds.Project({ id: id })
      project.fetch()
    else
      project = ds.collections.projects.get({cid: id}) || new ds.Project({ cid: id })
    project
