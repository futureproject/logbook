class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  defaults: ->
    kind: 'Coaching Session'
    school_id: ds.CURRENT_USER.get('school_id')
    site_id: ds.CURRENT_USER.get('site_id')
    duration: 0.5
    date: new Date().toString('yyyy-MM-dd')
    notes: []
    attendees: []

  toJSON: ->
    _.omit _.clone(@attributes), ['attendees', 'deletable']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Engagement' })
    {engagement: attrs }

  save: (key, val, options) ->
    # ensure this is a valid date
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    if !@get('attendee_ids')?
      @set('attendee_ids', [''])
    super

  canBeDeleted: ->
    # only allow models created within the last hour to be deleted
    created = @get('created_at')
    return true if !created
    timestamp = Date.parse(created).getTime()
    now = new Date().getTime()
    (now-timestamp)/1000 < 3600

  initialize: ->
    @on "upload:finished", (asset_url) =>
      asset = { external_url: asset_url }
      note = {
        author_id: ds.CURRENT_USER.get('id')
        assets_attributes: [asset]
      }
      @save { notes_attributes: [note]}
      @unset 'notes_attributes'

class ds.EngagementsCollection extends Backbone.Collection
  model: ds.Engagement
  namespace: 'engagements'
  url: -> ds.apiHelper.urlFor @namespace
  # return engagements that match the supplied list of attendee_ids
  getByAttendeeIds: (attendee_ids) ->
    attendee_ids = [attendee_ids] if (typeof attendee_ids != "object")
    results = _.map attendee_ids, (id) =>
      @filter (engagement) =>
        _.contains engagement.get('attendee_ids'), id
    _.flatten results

