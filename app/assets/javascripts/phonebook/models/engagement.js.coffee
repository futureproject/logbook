class Phonebook.Models.Engagement extends Backbone.Model

  urlRoot: ds.apiHelper.urlFor 'engagements'

  defaults: ->
    school_id: Phonebook.user.get('school_id')
    school: ''
    name: ''
    kind: 'Coaching Session'
    attendee_ids: []
    duration: 0.1
    date: new Date().toString('yyyy-MM-dd')
    notes: ''

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    attendee_ids = @get 'attendee_ids'
    if attendee_ids == null || attendee_ids.length == 0
      @set 'attendee_ids', ['']
    super

  toJSON: ->
    _.omit _.clone(@attributes), ['selected', 'attendees', 'assets']

  tplAttrs: ->
    attrs = _.clone @attributes
    date = Date.parse(@get 'date')
    attrs['shortmonth'] = date.toString('MMMM').slice(0,3)
    attrs['day_of_month'] = date.toString('dd')
    attrs['school'] = Phonebook.schools.get(@get('school_id'))?.get('name')
    attrs

class Phonebook.Collections.EngagementsCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Engagement
  url: ds.apiHelper.urlFor 'engagements'
  initialize: ->
    @listenToOnce Backbone, 'engagements:bootstrap', ->
      ds.bootstrapper.bootstrap @
  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))
  mode: 'client'
  state:
    pageSize: 50

