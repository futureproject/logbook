class Phonebook.Models.Engagement extends Backbone.Model
  defaults: ->
    school_id: Phonebook.USER.school_id
    kind: 'Dream Team Meeting'
    duration: 1
    date: new Date()

  initialize: ->
    console.log @get('date')
    #@set 'shortmonth', Date.parse(@get('date')).toString('MMMM').slice(0,3)
    #@set 'shortday', @get('date').split('-')[2]

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    super

  tplAttrs: ->
    attrs = _.clone @attributes
    attrs['shortmonth'] = if Date.parse(@get('date')) then Date.parse(@get('date')).toString('MMMM').slice(0,3) else ''
    attrs['day_of_month'] = @get('date').split('-')[2]
    attrs


class Phonebook.Collections.EngagementsCollection extends Backbone.Collection
  model: Phonebook.Models.Engagement
  url: ds.apiHelper.urlFor 'engagements'
  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))

