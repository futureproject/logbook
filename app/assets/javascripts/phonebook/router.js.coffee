class ds.Router extends Backbone.Router
  initialize: ->
    @on 'route', (route) -> Backbone.trigger 'routed', route

  routes:
    "phonebook": "people_index"
    "mobile": "people_index"
    "logbookapp": "people_index"
    "phonebook/people": "people_index"
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
    "logbook/report_submissions": "report_submissions_index"
    "logbook/report_submissions/:id": "report_submissions_show"
    # ASSOCIATIONS
    "logbook/:notable_type/:notable_id/notes/add": "notes_new"

  #HOME
  home: ->
    Backbone.trigger('people:index')

  #PEOPLE
  people_index: ->
    console.log 'ppL!'
    @navigate "/phonebook/people"
    Backbone.trigger "people:index"
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
  report_submissions_index: -> Backbone.trigger "report_submissions:index"
  report_submissions_show: (id) -> Backbone.trigger "report_submissions:show", id

  #NOTES
  notes_new: (type, obj_id) -> Backbone.trigger "notes:new", type, obj_id

