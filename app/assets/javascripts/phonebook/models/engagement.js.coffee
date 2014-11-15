class Phonebook.Models.Engagement extends Backbone.Model
  defaults: ->
    school_id: Phonebook.USER.school_id
    kind: 'Dream Team Meeting'
    duration: 1
    date: new Date()

  save: (key, val, options) ->
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    super

class Phonebook.Collections.EngagementsCollection extends Backbone.Collection
  model: Phonebook.Models.Engagement
  url: ds.apiHelper.urlFor 'engagements'
  comparator: (engagement) ->
    - Date.parse(engagement.get('date'))

