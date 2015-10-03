class ds.SchoolsDashboardView extends Backbone.View
  initialize: ->
    @views =
      schools_table: new ds.StatsTableView
        collection: ds.collections.schools
        columns: ds.collections.schools.backgrid_columns
        row: ds.StatsRowView
      people_timeline_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", {id: @model.id, graph: "people_timeline_graph"})
      hours_per_person_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", {id: @model.id, graph: "hours_per_person_graph"})
      project_percentage_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", {id: @model.id, graph: "project_percentage_graph"})
      engagement_percentage_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", {id: @model.id, graph: "engagement_percentage_graph"})
      program_hours_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", { id: @model.id, graph: "program_hours_graph" })
      engagement_counts_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", { id: @model.id, graph: "engagement_counts_graph" })
      weekly_rhythm_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("school_graphs", { id: @model.id, graph: "weekly_rhythm_graph" })
      time_filter: new ds.TimeFilterView

  template: JST['logbook/templates/schools_dashboard']

  className: 'dashboard'

  render: ->
    @$el.html @template(@model.toJSON())
    @postRender()
    @

  postRender: ->
    @views.time_filter.renderTo('#schools-time-filter')
    @$el.find('#schools-table').html @views.schools_table.render().el
    _.each [@views.schools_table], (table) ->
      ds.statsHelper.getStats(table.collection)

    # activate graphs
    @views.people_timeline_graph.renderTo('#people_timeline_graph')
    @views.hours_per_person_graph.renderTo('#hours_per_person_graph')
    @views.project_percentage_graph.renderTo('#project_percentage_graph')
    @views.engagement_percentage_graph.renderTo('#engagement_percentage_graph')
    @views.engagement_counts_graph.renderTo('#engagement_counts_graph')
    @views.program_hours_graph.renderTo('#program_hours_graph')
    @views.weekly_rhythm_graph.renderTo('#weekly_rhythm_graph')

  hide: -> _.each(@views, (view) -> view.remove() )
