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
        url: '/api/v1/nationals/0/people_timeline_graph'

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
    @views.people_timeline_graph.setElement('#people_timeline_graph')
    @views.people_timeline_graph.load()

