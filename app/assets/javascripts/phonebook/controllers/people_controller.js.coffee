class ds.PeopleController extends Backbone.View
  el: "#phonebook"
  initialize: ->
    @views = {}
    @collection = new ds.PeopleCollection
    @listenTo Backbone, "people:do", @do
    @listenTo Backbone, "people:move_up", @moveUp

  do: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)

  index: ->
    ds.router.navigate "phonebook/people"
    @views.index = new ds.PeopleIndexView
      collection: @collection
    @views.index.renderTo @el

  show: (id) ->
    ds.router.navigate "phonebook/people/#{id}"
    person = @getModelFromId(id)
    @views.show = new ds.PeopleShowView
      model: person
    @views.show.renderTo @el

  edit: (id) ->
    ds.router.navigate "phonebook/people/#{id}/edit"
    person = @getModelFromId(id)
    @views.edit = new ds.PeopleEditView
      model: person
    @views.edit.renderTo @el

  add_engagement: (id) ->
    ds.router.navigate "phonebook/people/#{id}/add/engagement"
    person = @getModelFromId(id)
    engagement = new ds.Engagement
      attendee_ids: @getAttendeeIdsFromRole(id, ds.user.current())
      school_id: person.get('school_id')
    @views.add_engagement = new ds.PeopleAddEngagementView
      model: engagement
      person: person
    @views.add_engagement.renderTo @el

  getModelFromId: (id) ->
    # if this is an actual id, not a cid
    collection = @collection.fullCollection || @collection
    if parseInt(id)
      person = collection.get(id) || new ds.Person({ id: id })
      person.fetch {success: -> collection.add person}
    else
      person = collection.get({cid: id}) || new ds.Person({ cid: id })
    person

  getAttendeeIdsFromRole: (person_id, user) ->
    if user.get('role').match(/volunteer|student|APR/i)
      [person_id, user.id]
    else
      [person_id]

  moveUp: (ids) ->
    collection = @collection.fullCollection || @collection
    _.each ids, (id) ->
      person = collection.get(id)
      if person? && person.id != ds.user.current()?.id
        collection.remove person
        collection.add person,
          at: 0
