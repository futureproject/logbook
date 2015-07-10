class ds.SitesDashboardView extends Backbone.View
  initialize: ->
    @views =
      schools_table: new Backgrid.Grid
        collection: ds.collections.schools
        columns: ds.collections.schools.backgrid_columns
      people_timeline_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", {id: @model.id, graph: "people_timeline_graph"})
      program_hours_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "program_hours_graph" })
      engagement_counts_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("site_graphs", { id: @model.id, graph: "engagement_counts_graph" })

  template: JST['logbook/templates/sites_dashboard']

  className: 'dashboard'

  render: ->
    @$el.html @template(@model.toJSON())
    @postRender()
    @

  postRender: ->
    @$el.find('#schools-table').html @views.schools_table.render().el
    _.each [@views.schools_table], (table) ->
      ds.statsHelper.getStats(table.collection)
    # activate graphs
    @views.people_timeline_graph.setElement('#people_timeline_graph')
    @views.people_timeline_graph.load()
    @views.engagement_counts_graph.setElement('#engagement_counts_graph')
    @views.engagement_counts_graph.load()
    @views.program_hours_graph.setElement('#program_hours_graph')
    @views.program_hours_graph.load()

