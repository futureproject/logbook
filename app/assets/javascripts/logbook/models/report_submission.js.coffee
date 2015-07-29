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
  backgrid_columns: [
    { name: 'status', cell: 'string' }
    { name: 'name', cell: ds.LogbookLinkCell }
    { name: 'excerpt', cell: ds.LogbookLinkCell, label: 'Questions', sortable: false }
    { name: 'created_at', cell: 'date', label: 'Date Assigned' }
  ]
  mode: 'client'
  state:
    pageSize: 50
