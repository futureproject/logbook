class ds.ReportsSubmittedView extends Backbone.View
  initialize: (args) ->
    @collection = args.collection
    @views =
      table: new ds.IndexTableView
        collection: @collection
        columns: @collection.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: @collection
      filters: new ds.TableFiltersView
        collection: @collection
        template: JST["logbook/templates/report_submissions_filters"]
    @listenTo Backbone, 'filters:apply', @applyFilters

  template: JST['logbook/templates/reports_submitted']

  className: 'reports'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#report-submissions-table"
    @views.pagination.renderTo '#report-submissions-pagination'
    @views.filters.renderTo "#report-submissions-filters"

  applyFilters: (namespace, data) ->
    console.log namespace
    console.log data
    return unless namespace == "report_submissions"
    @collection.queryParams[filter] = val for filter, val of data
    @views.table.$el.css('opacity','.25')
    @collection.fetch
      reset: true
      complete: (response) =>
        console.log response
        @views.table.$el.css('opacity','1')
