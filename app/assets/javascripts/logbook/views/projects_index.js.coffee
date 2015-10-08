class ds.ProjectsIndexView extends Backbone.View
  initialize: ->
    @collection = ds.collections.projects
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "projects_leaderboard"
      table: new ds.IndexTableView
        collection: @collection
        columns: @collection.backgrid_columns
      pagination: new ds.BackgridPaginator
        collection: @collection
      filters: new ds.TableFiltersView
        collection: @collection
        template: JST["logbook/templates/projects_filters"]

    @listenTo Backbone, 'filters:apply', @applyFilters

  template: JST['logbook/templates/projects_index']

  className: 'projects'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.leaderboard.renderTo "#projects-leaderboard"
    @views.table.renderTo "#projects-table"
    @views.pagination.renderTo '#projects-pagination'
    @views.filters.renderTo "#projects-filters"

  applyFilters: (namespace, data) ->
    return unless namespace == "projects"
    @collection.queryParams[filter] = val for filter, val of data
    @views.table.$el.css('opacity','.25')
    @collection.fetch
      reset: true
      complete: =>
        @views.table.$el.css('opacity','1')
