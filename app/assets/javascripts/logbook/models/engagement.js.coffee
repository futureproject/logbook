class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  defaults: ->
    kind: 'Coaching Session'
    school_id: ds.current_user.get('school_id')
    duration: 0.5
    date: new Date().toString('yyyy-MM-dd')
    notes: []
    attendees: []
    projects: []

  toJSON: ->
    _.omit _.clone(@attributes), ['attendees', 'notes','projects']

  tplAttrs: ->
    attrs = _.extend(_.clone(@attributes), { class_name: 'Engagement' })
    {engagement: attrs }

  save: (key, val, options) ->
    # ensure this is a valid date
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
    @set('attendee_ids', ['']) if !@get('attendee_ids')?
    @set('project_ids', ['']) if !@get('project_ids')?
    super

class ds.EngagementsCollection extends Backbone.PageableCollection
  model: ds.Engagement
  namespace: 'engagements'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: (args) ->
    args ||= {}
    @mode = args.mode || 'server'
  backgrid_columns: [
    {name: 'name', cell: ds.LogbookLinkCell }
    {name: 'kind', cell: ds.LogbookLinkCell }
    {name: 'headcount', cell:'integer'}
    {name: 'duration', cell:'number', label: "Duration (Hrs)"}
    {name: 'notes_count', cell:'integer', label: "Notes"}
    {name: 'date', cell: 'date' }
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }
