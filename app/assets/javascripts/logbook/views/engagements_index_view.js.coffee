class ds.EngagementsIndexView extends Backbone.View
  initialize: ->
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "engagements_leaderboard"
      table: new ds.IndexTableView
        collection: ds.collections.engagements
        columns: ds.collections.engagements.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.engagements

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
