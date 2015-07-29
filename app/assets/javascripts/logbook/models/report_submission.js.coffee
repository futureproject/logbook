class ds.ReportSubmission extends Backbone.Model
  namespace: 'report_submissions'
  urlRoot: ds.apiHelper.urlFor 'report_submissions'
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'ReportSubmission' })
    {report_submission: attrs }

class ds.ReportSubmissionsCollection extends Backbone.PageableCollection
  model: ds.ReportSubmission
  namespace: 'report_submissions'
  url: -> ds.apiHelper.urlFor @namespace
  initialize: (args) ->
    args ||= {}
    @mode = args.mode || 'server'
  backgrid_columns: [
    { name: 'status', cell: 'string' }
    { name: 'name', cell: ds.LogbookLinkCell }
    { name: 'excerpt', cell: ds.LogbookLinkCell, label: 'Questions', sortable: false }
    { name: 'created_at', cell: 'date', label: 'Date Assigned' }
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }

