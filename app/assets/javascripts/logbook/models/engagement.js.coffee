class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  defaults: ->
    kind: 'Coaching Session'
    school_id: ds.current_user.get('school_id')
    attendees: []
    duration: 0.1
    date: new Date().toString('yyyy-MM-dd')

  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Engagement' })
    {engagement: attrs }

  save: (key, val, options) ->
    # ensure this is a valid date
    @set 'date', Date.parse(@get('date')).toString('yyyy-MM-dd')
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
    {name: 'kind', cell: 'string' }
    {name: 'headcount', cell:'integer'}
    {name: 'duration', cell:'integer', label: "Duration (Hrs)"}
    {name: 'date', cell: 'date' }
  ]
  parseRecords: (response) ->
    response.engagements
  parseState: (response) ->
    { totalRecords: response.state.total_entries }
