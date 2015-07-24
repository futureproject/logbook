class ds.ProjectsIndexView extends Backbone.View
  initialize: ->
    @views =
      leaderboard: new ds.LeaderboardView
        url: ds.apiHelper.urlFor "projects_leaderboard"
      table: new ds.IndexTableView
        collection: ds.collections.projects
        columns: ds.collections.projects.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.projects

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

