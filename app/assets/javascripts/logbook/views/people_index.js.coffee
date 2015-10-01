class ds.PeopleIndexView extends Backbone.View
  initialize: ->
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "people_leaderboard"
      table: new ds.IndexTableView
        collection: ds.collections.people
        columns: ds.collections.people.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.people

    @listenTo ds.collections.people, 'reset', @renderHeader

  template: JST['logbook/templates/people_index']

  className: 'people'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.leaderboard.renderTo "#people-leaderboard"
    @views.table.renderTo "#people-table"
    @views.pagination.renderTo '#people-pagination'
    @renderHeader()

  renderHeader: ->
    length = ds.collections.people.state.totalRecords || 0
    @$el.find('#people-table-label').html "Listing #{length} people."

