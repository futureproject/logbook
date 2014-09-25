class dream.AppPresenter extends Backbone.View
  initialize: (app) ->
    @app = app
    @tweakUI()
    @prepAjax()
    @initPresenters()

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
      engagements: new dream.EngagementsPresenter
