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
    #"phonebook/engagements/new": "engagements_new"
    #"phonebook/engagements/new/:person_id": "engagements_new"

  #PEOPLE
  people_index: -> Backbone.trigger "people:do", "index"
  people_show: (id) -> Backbone.trigger "people:do", "show", id
  people_edit: (id) -> Backbone.trigger "people:do", "edit", id
  people_add_engagement: (id) -> Backbone.trigger "people:do", "add_engagement", id

  #ENGAGEMENTS
  engagements_new: (person_id) -> Backbone.trigger "engagements:do", "new", person_id
  engagements_edit: (id) -> Backbone.trigger "engagements:do", "edit", id
