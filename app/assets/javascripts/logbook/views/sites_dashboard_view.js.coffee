class ds.SitesDashboardView extends Backbone.View
  initialize: ->
    @views =
      schools_table: new ds.StatsTableView
        collection: ds.collections.schools
        columns: ds.collections.schools.backgrid_columns
      people_timeline_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", {id: @model.id, graph: "people_timeline_graph"})
      program_hours_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "program_hours_graph" })
      engagements_context_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "engagements_context_graph" })
      engagement_counts_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "engagement_counts_graph" })
      projects_started_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "project_counts_graph" })
      projects_completed_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "project_counts_graph" }) + "?status=complete"
      sites_table: new ds.StatsTableView
        collection: ds.collections.sites
        columns: ds.collections.sites.backgrid_columns
        row: ds.StatsRowView

  template: JST['logbook/templates/sites_dashboard']

  className: 'dashboard'

  render: ->
    @$el.html @template(@model.toJSON())
    @postRender()
    @

  postRender: ->
    @$el.find('#schools-table').html @views.schools_table.render().el
    @$el.find('#sites-table').html @views.sites_table.render().el
    _.each [@views.schools_table, @views.sites_table], (table) ->
      ds.statsHelper.getStats(table.collection)
    # activate graphs
    @views.people_timeline_graph.renderTo('#people_timeline_graph')
    @views.engagements_context_graph.renderTo('#engagements_context_graph')
    @views.engagement_counts_graph.renderTo('#engagement_counts_graph')
    @views.program_hours_graph.renderTo('#program_hours_graph')
    @views.projects_started_graph.renderTo('#projects_started_graph')
    @views.projects_completed_graph.renderTo('#projects_completed_graph')

  hide: -> _.each(@views, (view) -> view.remove() )
