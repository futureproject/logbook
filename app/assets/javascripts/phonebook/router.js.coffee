class ds.Router extends Backbone.Router
  initialize: ->
    @on 'route', (route) -> Backbone.trigger 'routed', route

  routes:
    "phonebook": "people_index"
    "mobile": "people_index"
    "logbookapp": "people_index"
    "phonebook/people": "people_index"
    "phonebook/people/:id": "people_show"
    "phonebook/people/:id/edit": "people_edit"
    "phonebook/people/:id/add/engagement": "people_add_engagement"

  #PEOPLE
  people_index: -> Backbone.trigger "people:do", "index"
  people_show: (id) -> Backbone.trigger "people:do", "show", id
  people_edit: (id) -> Backbone.trigger "people:do", "edit", id
  people_add_engagement: (id) -> Backbone.trigger "people:do", "add_engagement", id

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

