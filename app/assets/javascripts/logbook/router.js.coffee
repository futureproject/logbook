class ds.Router extends Backbone.Router
  routes:
    "logbook": "dashboard"
    "logbook/people": "people_index"
    "logbook/engagements": "engagements_index"
    "logbook/projects": "projects_index"
    "logbook/reports": "reports_index"

  #DASHBOARD
  dashboard: -> Backbone.trigger "dashboard:show"

  #PEOPLE
  people_index: -> Backbone.trigger "people:index"

  #ENGAGEMENTS
  engagements_index: -> Backbone.trigger "engagements:index"

  #PROJECTS
  projects_index: -> Backbone.trigger "projects:index"

  #REPORTS
  reports_index: -> Backbone.trigger "reports:index"
