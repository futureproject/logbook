class ds.PeopleController extends Backbone.View
  initialize: ->
    @views = {}
    @collection = ds.collections.people
    @listenTo Backbone, "people:action", @action
    @listenTo Backbone, "people:sync", -> @collection.bootstrap()
    @listenTo Backbone, "engagement:created", @moveAttendeesToTop

  action: (fn, args) ->
    # hide all open views
    _.each @views, (view) =>
      view.hide() unless view == @views[fn]
    # If the function specified in the 'fn' argument exists, call it.
    @[fn]?(args)
    # reset the scroll position of the body
    Backbone.trigger 'app:resetScroll'

  index: ->
    ds.router.navigate "phonebook/people"
    @views.index = new ds.PeopleIndexView
      collection: @collection
    @views.index.renderTo ds.views.app.el, {replace: true }

  show: (id) ->
    ds.router.navigate "phonebook/people/#{id}"
    person = @getModelFromId(id)
    @views.show = new ds.PersonShowView
      model: person
    @views.show.renderTo ds.views.app.el

  edit: (id) ->
    ds.router.navigate "phonebook/people/#{id}/edit"
    person = @getModelFromId(id)
    @views.edit = new ds.PersonEditView
      model: person
    @views.edit.renderTo ds.views.app.el

  add_engagement: (id) ->
    ds.router.navigate "phonebook/people/#{id}/add/engagement"
    person = @getModelFromId(id)
    engagement = new ds.Engagement
      attendee_ids: @getAttendeeIdsFromRole(id, ds.CURRENT_USER)
      school_id: person.get('school_id')
    @views.add_engagement = new ds.PersonAddEngagementView
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

  # after an engagement is created, move said engagement's attendees
  # to the top of the people collection
  moveAttendeesToTop: (engagement) ->
    collection = @collection.fullCollection || @collection
    people = collection.getMultiple engagement.get('attendee_ids')
    console.log people
    for person in people
      collection.remove person
      collection.add person,
        at: 0
    # persist this new order in localStorage!
    window.localStorage.setItem(collection.url(), collection.pluck('id').join(','))


