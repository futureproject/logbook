class Phonebook.Models.Engagement extends Backbone.Model
  urlRoot: ds.apiHelper.urlFor 'engagements'

  defaults: ->
    school_id: Phonebook.user.get('school_id')
    kind: 'Meeting'
    attendee_ids: []
    duration: 1
    date: new Date().toString('yyyy-MM-dd')
    notes: ''

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    @set('attendee_ids',['']) if @get('attendee_ids') == null
    super

  toJSON: ->
    _.omit _.clone(@attributes), ['selected', 'editing', 'operating', 'uploading']

  tplAttrs: ->
    attrs = _.clone @attributes
    date = Date.parse(@get 'date')
    attrs['shortmonth'] = date.toString('MMMM').slice(0,3)
    attrs['day_of_month'] = date.toString('dd')
    attrs['school'] = Phonebook.schools.get(@get('school_id'))?.get('name')
    attrs


class Phonebook.Collections.EngagementsCollection extends Backbone.Collection
  model: Phonebook.Models.Engagement
  url: ds.apiHelper.urlFor 'engagements'
  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))

