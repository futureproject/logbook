class Phonebook.Models.Engagement extends Backbone.Model
  className: 'Engagement'
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'

  defaults: ->
    school_id: Phonebook.user.get('school_id')
    school: ''
    name: ''
    kind: 'Coaching Session'
    attendee_ids: []
    attendees: []
    duration: 0.1
    date: new Date().toString('yyyy-MM-dd')
    notes: ''

# Backbone.DualStorage saves selected state, so ignore it
  parse: (response) -> _.omit response, ['selected']

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    a = @get('attendees')
# rails misinterprets an empty array of association_ids, so give it a blank  string
    ids = if a.length == 0 then [''] else _.pluck(a, 'id')
    @set 'attendee_ids', ids
    super

  #toJSON: ->
    #_.omit _.clone(@attributes), ['selected', 'attendees', 'assets']

  tplAttrs: ->
    attrs = _.clone @attributes
    date = Date.parse(@get 'date')
    attrs['shortmonth'] = date.toString('MMMM').slice(0,3)
    attrs['day_of_month'] = date.toString('dd')
    attrs['school'] = Phonebook.schools.get(@get('school_id'))?.get('name')
    attrs

class Phonebook.Collections.EngagementsCollection extends Backbone.PageableCollection
  model: Phonebook.Models.Engagement
  namespace: 'engagements'
  url: -> ds.apiHelper.urlFor @namespace
  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))
  mode: 'client'
  state:
    pageSize: 50

