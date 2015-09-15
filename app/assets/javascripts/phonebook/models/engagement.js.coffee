class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  defaults: ->
    kind: 'Coaching Session'
    school_id: ds.user.current()?.get('school_id')
    duration: 0.1
    date: new Date().toString('yyyy-MM-dd')
    notes: []
    attendees: []

  toJSON: ->
    _.omit _.clone(@attributes), ['attendees', 'notes']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Engagement' })
    {engagement: attrs }

  save: (key, val, options) ->
    # ensure this is a valid date
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    @set('attendee_ids', ['']) if !@get('attendee_ids')?
    super

  canBeDeleted: ->
    # only allow models created within the last hour to be deleted
    timestamp = Date.parse(@get('created_at')).getTime()
    now = new Date().getTime()
    (now-timestamp)/1000 < 3600

class ds.EngagementsCollection extends Backbone.PageableCollection
  model: ds.Engagement
  namespace: 'engagements'
  url: -> ds.apiHelper.urlFor @namespace
  mode: 'client'
  initialize: ->
    @reset
      remote: false
      success: => @syncDirtyAndDestroyed()
