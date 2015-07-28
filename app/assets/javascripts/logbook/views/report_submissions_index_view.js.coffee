class ds.ReportSubmissionsIndexView extends Backbone.View
  initialize: ->
    @views =
      table: new ds.IndexTableView
        collection: ds.collections.report_submissions
        columns: ds.collections.report_submissions.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.report_submissions

  template: JST['logbook/templates/report_submissions_index']

  className: 'reports'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#report-submissions-table"
    @views.pagination.renderTo '#report-submissions-pagination'

