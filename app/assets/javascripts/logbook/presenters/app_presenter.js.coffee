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
      <div id="logbook_engagements" class="tab_target"></div>
    ')

  prepAjax: ->
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      options.url = "/api/v1#{options.url}.json"
      jqXHR.withCredentials = true
      console.log options.url

    $(document).ajaxError (event, request, c) ->
      location.href = '/' if request.status == 403

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
      engagements: new dream.EngagementsPresenter
      #task_assignments: new dream.TaskAssignmentsPresenter
      one_on_ones: new dream.OneOnOnesPresenter
      reports: new dream.ReportsPresenter
      testimonials: new dream.TestimonialsPresenter
      reflections: new dream.ReflectionsPresenter

  initRouters: ->
    @routers =
      people: new dream.Routers.StatsRouter({ presenter: @presenters.stats })
      people: new dream.Routers.PeopleRouter({ presenter: @presenters.people })
      projects: new dream.Routers.ProjectsRouter({ presenter: @presenters.projects })
      engagements: new dream.Routers.EngagementsRouter({ presenter: @presenters.engagements })

  events:
    'touchstart .scrollable' : 'fixScrollBounce'
    'touchmove .scrollable' : (e) -> e.stopPropagation()

  fixScrollBounce: (e) ->
    el = e.currentTarget
    isAtTop = (el.scrollTop is 0)
    isAtBottom = (el.scrollHeight - el.scrollTop is height)
    height = el.getBoundingClientRect().height
    if isAtTop or isAtBottom
      # if the content is too short, put it all in a tall div
      if el.scrollHeight <= height
        scrollPad = document.createElement("div")
        scrollPad.style.minHeight = "100%"
        scrollPad.style.paddingBottom = "2px"
        scrollPad.innerHTML = el.innerHTML
        el.innerHTML = ""
        el.appendChild scrollPad
      # adjust the scroll position by one pixel, which bypasses
      # the scroll bounce on the document body
      if isAtTop
        el.scrollTop += 1
      else el.scrollTop -= 1  if isAtBottom
