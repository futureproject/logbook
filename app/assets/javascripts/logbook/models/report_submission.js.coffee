class ds.ReportSubmission extends Backbone.Model
  namespace: 'reports'
  urlRoot: ds.apiHelper.urlFor 'report_submissions'
  defaults:
    person: {}
  tplAttrs: ->
    attrs = _.extend(@toJSON(), { class_name: 'ReportSubmission' })
    {report_submission: attrs }

class ds.ReportSubmissionsCollection extends Backbone.Collection
  model: ds.ReportSubmission
  namespace: 'report_submissions'
  url: -> ds.apiHelper.urlFor @namespace
  backgrid_columns: [
    { name: 'status', cell: 'string' }
    { name: 'name', cell: ds.LogbookLinkCell, label: 'Report Name' }
    { name: 'excerpt', cell: ds.LogbookLinkCell, label: 'Questions', sortable: false }
    { name: 'created_at', cell: 'date', label: 'Date Assigned' }
  ]

class ds.ReportsSubmittedCollection extends Backbone.PageableCollection
  model: ds.ReportSubmission
  namespace: 'report_submissions'
  url: -> ds.apiHelper.urlFor "reports_submitted"
  backgrid_columns: [
    { name: 'name', cell: ds.LogbookLinkCell, label: 'Report Name' }
    { name: 'excerpt', cell: ds.LogbookLinkCell, label: 'Questions', sortable: false }
    { name: 'author', cell: 'string', sortable: false }
    { name: 'city', cell: 'string', sortable: false }
    { name: 'date_submitted', cell: 'date', label: 'Date Submitted' }
  ]
  parseRecords: (response) ->
    response.data
  parseState: (response) ->
    { totalRecords: response.state.total_entries }
