class ds.Router extends Backbone.Router
  initialize: ->
    @on 'route', (route) -> Backbone.trigger 'routed', route

  routes:
    "logbook": "dashboard"
    "logbook/dashboard": "dashboard"
    "logbook/people": "people_index"
    "logbook/people/spreadsheet": "people_spreadsheet"
    "logbook/people/new": "people_new"
    "logbook/people/:id": "people_show"
    "logbook/people/:id/edit": "people_edit"
    "logbook/engagements": "engagements_index"
    "logbook/engagements/new": "engagements_new"
    "logbook/engagements/:id": "engagements_show"
    "logbook/engagements/:id/edit": "engagements_edit"
    "logbook/projects": "projects_index"
    "logbook/projects/new": "projects_new"
    "logbook/projects/:id": "projects_show"
    "logbook/projects/:id/edit": "projects_edit"
    "logbook/reports": "reports_assigned"
    "logbook/reports/submitted": "reports_submitted"
    "logbook/reports/:id": "reports_view"
    "logbook/hashtags/:hashtag": "hashtags_view"
    "logbook/gallery": "assets_index"
    # ASSOCIATIONS
    "logbook/:notable_type/:notable_id/notes/add": "notes_new"

  #DASHBOARD
  dashboard: -> Backbone.trigger "dashboard:show"

  #PEOPLE
  people_index: -> Backbone.trigger "people:index"
  people_spreadsheet: -> Backbone.trigger "people:spreadsheet"
  people_show: (id) -> Backbone.trigger "people:show", id
  people_new: (model) -> Backbone.trigger "people:new", model
  people_edit: (id) -> Backbone.trigger "people:edit", id

  #ENGAGEMENTS
  engagements_index: -> Backbone.trigger "engagements:index"
  engagements_show: (id) -> Backbone.trigger "engagements:show", id
  engagements_new: (model) -> Backbone.trigger "engagements:new", model
  engagements_edit: (id) -> Backbone.trigger "engagements:edit", id

  #PROJECTS
  projects_index: -> Backbone.trigger "projects:index"
  projects_show: (id) -> Backbone.trigger "projects:show", id
  projects_new: (model) -> Backbone.trigger "projects:new", model
  projects_edit: (id) -> Backbone.trigger "projects:edit", id

  #REPORTS
  reports_assigned: -> Backbone.trigger "reports:assigned"
  reports_submitted: -> Backbone.trigger "reports:submitted"
  reports_view: (id) -> Backbone.trigger "reports:view", id

  #HASHTAGS
  hashtags_view: (tag) -> Backbone.trigger "hashtags:view", tag

  #NOTES
  notes_new: (type, obj_id) -> Backbone.trigger "notes:new", type, obj_id

  # ASSETS
  assets_index: -> Backbone.trigger "assets:index"

