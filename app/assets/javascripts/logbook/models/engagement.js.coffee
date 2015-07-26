class ds.Engagement extends Backbone.Model
  namespace: 'engagements'
  urlRoot: ds.apiHelper.urlFor 'engagements'
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'Engagement' })
    {engagement: attrs }

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
