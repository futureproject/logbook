class ds.Router extends Backbone.Router
  initialize: ->
    @on 'route', (route) -> Backbone.trigger 'router:routed', route

  routes:
    "phonebook": "people_index"
    "mobile": "people_index"
    "logbookapp": "people_index"
    "phonebook/people": "people_index"
    "phonebook/people/:id": "people_show"
    "phonebook/people/:id/edit": "people_edit"
    "phonebook/people/:id/add/engagement": "people_add_engagement"
    "phonebook/engagements/new": "engagements_new"
    "phonebook/engagements/:id": "engagements_show"
    #"phonebook/engagements/new/:person_id": "engagements_new"

  #PEOPLE
  people_index: -> Backbone.trigger "people:action", "index"
  people_show: (id) -> Backbone.trigger "people:action", "show", id
  people_edit: (id) -> Backbone.trigger "people:action", "edit", id
  people_add_engagement: (id) -> Backbone.trigger "people:action", "add_engagement", id

  #ENGAGEMENTS
  engagements_new: -> Backbone.trigger "engagements:action", "new"
  engagements_show: (id) -> Backbone.trigger "engagements:action", "show", id
  engagements_edit: (id) -> Backbone.trigger "engagements:action", "edit", id

