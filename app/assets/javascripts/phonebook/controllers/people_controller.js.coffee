class ds.PeopleController extends Backbone.View
  initialize: ->
    @views = {}
    @collection = ds.collections.people
    @listenTo Backbone, "people:action", @action
    @listenTo Backbone, "people:move_up", @moveUp

  action: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)
    Backbone.trigger 'app:resetScroll'

  index: ->
    ds.router.navigate "phonebook/people"
    @views.index = new ds.PeopleIndexView
      collection: @collection
    @views.index.renderTo ds.views.app.el, {replace: true }

  show: (id) ->
    ds.router.navigate "phonebook/people/#{id}"
    person = @getModelFromId(id)
    @views.show = new ds.PeopleShowView
      model: person
    @views.show.renderTo ds.views.app.el

  edit: (id) ->
    ds.router.navigate "phonebook/people/#{id}/edit"
    person = @getModelFromId(id)
    @views.edit = new ds.PeopleEditView
      model: person
    @views.edit.renderTo ds.views.app.el

  add_engagement: (id) ->
    ds.router.navigate "phonebook/people/#{id}/add/engagement"
    person = @getModelFromId(id)
    engagement = new ds.Engagement
      attendee_ids: @getAttendeeIdsFromRole(id, ds.user.current())
      school_id: person.get('school_id')
    @views.add_engagement = new ds.PeopleAddEngagementView
      model: engagement
      person: person
    @views.add_engagement.renderTo ds.views.app.el

  getModelFromId: (id) ->
    # if this is an actual id, not a cid
    if parseInt(id)
      person = @collection.get(id) || new ds.Person({ id: id })
      person.fetch {success: => @collection.add person}
    else
      person = @collection.get({cid: id}) || new ds.Person({ cid: id })
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

