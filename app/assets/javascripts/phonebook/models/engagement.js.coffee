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
    _.omit _.clone(@attributes), ['attendees', 'notes', 'deletable']

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
    created = @get('created_at')
    return true if !created
    timestamp = Date.parse(created).getTime()
    now = new Date().getTime()
    (now-timestamp)/1000 < 3600

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

#class ds.AssociatedEngagementsCollection extends Backbone.Collection
  #model: ds.Engagement
  #initialize: (models, args) ->
    #@[option] = args[option] for option of args
    #@listenTo @source, 'change:engagements', @staySynced

  #staySynced: (source) ->
    #@add source.get('engagements')

  #comparator: (engagement) ->
    #- Date.parse(engagement.get('date'))
