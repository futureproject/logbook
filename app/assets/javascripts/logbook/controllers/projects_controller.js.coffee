class ds.ProjectsController extends ds.BaseController
  rootURL: "logbook/projects"
  el: "#projects-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "projects:index", @index

  index: ->
    @activate()
    $(@targetEl).empty().html "<h1>projects</h1>"

