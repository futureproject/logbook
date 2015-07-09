class ds.SitesDashboardView extends Backbone.View
  initialize: ->
    @views =
      schools_table: new Backgrid.Grid
        collection: ds.collections.schools
        columns: ds.collections.schools.backgrid_columns

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

