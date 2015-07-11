class ds.NationalDashboardView extends Backbone.View
  initialize: ->
    @views =
      sites_table: new Backgrid.Grid
        collection: ds.collections.sites
        columns: ds.collections.sites.backgrid_columns
      schools_table: new Backgrid.Grid
        collection: ds.collections.schools
        columns: ds.collections.schools.backgrid_columns
      people_timeline_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "people_timeline_graph")
      program_hours_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "program_hours_graph")
      engagement_counts_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "engagement_counts_graph")
      engagements_context_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "engagements_context_graph")
      projects_started_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "projects_started_graph")
      projects_completed_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("national_graphs", "projects_completed_graph")

  template: JST['logbook/templates/national_dashboard']

  className: 'dashboard'

  render: ->
    @$el.html @template(@model.toJSON())
    @postRender()
    @

  postRender: ->
    # activate tables
    @$el.find('#sites-table').html @views.sites_table.render().el
    @$el.find('#schools-table').html @views.schools_table.render().el
    _.each [@views.sites_table, @views.schools_table], (table) ->
      ds.statsHelper.getStats(table.collection)

    # activate graphs
    @views.people_timeline_graph.renderTo('#people_timeline_graph')
    @views.engagement_counts_graph.renderTo('#engagement_counts_graph')
    @views.engagements_context_graph.renderTo('#engagements_context_graph')
    @views.program_hours_graph.renderTo('#program_hours_graph')
    @views.projects_started_graph.renderTo('#projects_started_graph')
    @views.projects_completed_graph.renderTo('#projects_completed_graph')

