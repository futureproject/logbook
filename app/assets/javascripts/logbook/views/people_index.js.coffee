class ds.PeopleIndexView extends Backbone.View
  initialize: ->
    @collection = ds.collections.people
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "people_leaderboard"
      table: new ds.IndexTableView
        collection: @collection
        columns: @collection.backgrid_columns
      pagination: new ds.BackgridPaginator
        collection: @collection
      filters: new ds.TableFiltersView
        collection: @collection
        template: JST["logbook/templates/people_filters"]

    @listenTo Backbone, 'filters:apply', @applyFilters

  template: JST['logbook/templates/people_index']

  events:
    'change .view-style': (event) ->
      val = $(event.currentTarget).val()
      if val == "editor"
        path = "/logbook/people/spreadsheet"
        ds.router.navigate path, { trigger: true }

  className: 'people'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.leaderboard.renderTo "#people-leaderboard"
    @views.table.renderTo "#people-table"
    @views.pagination.renderTo '#people-pagination'
    @views.filters.renderTo "#people-filters"

  applyFilters: (namespace, data) ->
    return unless namespace == "people"
    @collection.queryParams[filter] = val for filter, val of data
    @views.table.$el.css('opacity','.25')
    @collection.fetch
      reset: true
      complete: =>
        @views.table.$el.css('opacity','1')
