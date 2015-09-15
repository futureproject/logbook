class ds.ReportsSubmittedView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection
    @views =
      table: new ds.IndexTableView
        collection: @collection
        columns: @collection.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: @collection

  template: JST['logbook/templates/reports_submitted']

  className: 'reports'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#report-submissions-table"
    @views.pagination.renderTo '#report-submissions-pagination'

