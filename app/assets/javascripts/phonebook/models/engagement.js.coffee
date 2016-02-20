class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  defaults: ->
    kind: 'Coaching Session'
    school_id: ds.IDENTITY.get('person').school_id
    site_id: ds.IDENTITY.get('person').site_id
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

  initialize: ->
    @on "upload:finished", (asset_url) =>
      asset = { external_url: asset_url }
      note = {
        author_id: ds.IDENTITY.get('person').id
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

