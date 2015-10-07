class ds.EngagementsIndexView extends Backbone.View
  initialize: ->
    @collection = ds.collections.engagements
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "engagements_leaderboard"
      table: new ds.IndexTableView
        collection: @collection
        columns: @collection.backgrid_columns
      pagination: new ds.BackgridPaginator
        collection: @collection
      filters: new ds.TableFiltersView
        collection: @collection
        className: "table-filters engagements-filters"
        template: JST["logbook/templates/engagements_filters"]

    @listenTo Backbone, 'filters:apply', @applyFilters

  template: JST['logbook/templates/engagements_index']

  className: 'engagements'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.leaderboard.renderTo "#engagements-leaderboard"
    @views.table.renderTo "#engagements-table"
    @views.pagination.renderTo '#engagements-pagination'
    @views.filters.renderTo "#engagements-filters"

  applyFilters: (namespace, data) ->
    return unless namespace == "engagements"
    @collection.queryParams[filter] = val for filter, val of data
    @views.table.$el.css('opacity','.25')
    @collection.fetch
      reset: true
      complete: =>
        @views.table.$el.css('opacity','1')
