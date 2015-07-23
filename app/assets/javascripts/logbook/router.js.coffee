class ds.Router extends Backbone.Router
  initialize: ->
    @on 'route', (route) -> Backbone.trigger 'routed', route

  routes:
    "logbook": "dashboard"
    "logbook/people": "people_index"
    "logbook/people/:id": "people_show"
    "logbook/people/:id/edit": "people_edit"
    "logbook/engagements": "engagements_index"
    "logbook/projects": "projects_index"
    "logbook/reports": "reports_index"

  #DASHBOARD
  dashboard: -> Backbone.trigger "dashboard:show"

  #PEOPLE
  people_index: -> Backbone.trigger "people:index"
  people_show: (id) -> Backbone.trigger "people:show", id
  people_edit: (id) -> Backbone.trigger "people:edit", id

  #ENGAGEMENTS
  engagements_index: -> Backbone.trigger "engagements:index"

  #PROJECTS
  projects_index: -> Backbone.trigger "projects:index"

  #REPORTS
  reports_index: -> Backbone.trigger "reports:index"
