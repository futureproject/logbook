class dream.AppPresenter extends Backbone.View
  initialize: (app) ->
    @app = app
    @render()
    @tweakUI()
    @prepAjax()
    @initViews()
    @initPresenters()
    @initRouters()

  el: '#canvas'

  render: ->
    @$el.html('
      <div id="logbook_stats" class="tab_target"></div>
      <div id="logbook_tasks" class="tab_target"></div>
      <div id="logbook_people" class="tab_target"></div>
      <div id="logbook_projects" class="tab_target"></div>
      <div id="logbook_workshops" class="tab_target"></div>
    ')

  prepAjax: ->
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true
      console.log options.url

  tweakUI: ->
    $(document).on('click', 'a', (e) ->
      if (navigator.standalone)
        e.preventDefault()
        location.href = this.href
    ).on('click', '.flash', (e) ->
      $(this).fadeOut()
    )

  initViews: ->

  initPresenters: ->
    @presenters =
      stats: new dream.StatsPresenter
      people: new dream.PeoplePresenter
      projects: new dream.ProjectsPresenter
      workshops: new dream.WorkshopsPresenter
      #task_assignments: new dream.TaskAssignmentsPresenter
      #workshops: new dream.WorkshopsPresenter

  initRouters: ->
    @routers =
      people: new dream.Routers.StatsRouter({ presenter: @presenters.stats })
      people: new dream.Routers.PeopleRouter({ presenter: @presenters.people })
      projects: new dream.Routers.ProjectsRouter({ presenter: @presenters.projects })
      workshops: new dream.Routers.WorkshopsRouter({ presenter: @presenters.workshops })
