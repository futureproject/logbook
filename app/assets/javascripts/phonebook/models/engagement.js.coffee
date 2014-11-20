class Phonebook.Models.Engagement extends Backbone.Model
  initialize: ->
    console.log "engagement date is a: #{typeof @get 'date'}"

  defaults: ->
    school_id: Phonebook.user.get('school_id')
    kind: 'Dream Team Meeting'
    attendee_ids: []
    duration: 1
    date: new Date().toString('yyyy-MM-dd')

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    super

  toJSON: ->
    _.omit _.clone(@attributes), ['selected']

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

