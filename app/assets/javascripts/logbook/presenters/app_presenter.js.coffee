class dream.AppPresenter extends Backbone.View
  initialize: (app) ->
    @app = app
    @tweakUI()
    @prepAjax()
    @initPresenters()

  el: '#canvas'

  render: ->
    @$el.html('
      <div id="logbook_home" class="tab_target"></div>
      <div id="logbook_tasks" class="tab_target"></div>
      <div id="logbook_people" class="tab_target"></div>
      <div id="logbook_projects" class="tab_target"></div>
      <div id="logbook_workshops" class="tab_target"></div>
    ')

  prepAjax: ->
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true

  tweakUI: ->
    $(document).on('click', 'a', (e) ->
      if (navigator.standalone)
        e.preventDefault()
        location.href = this.href
    ).on('click', '.flash', (e) ->
      $(this).fadeOut()
    )

  initPresenters: ->
    @presenters =
      projects: new dream.ProjectsPresenter
      tasks: new dream.TasksPresenter
      workshops: new dream.WorkshopsPresenter

