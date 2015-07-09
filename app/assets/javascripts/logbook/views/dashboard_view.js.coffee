class ds.DashboardView extends Backbone.View
  initialize: ->
    @views = {}
    if @model.namespace = "sites"
      @views.site_schools_table = new ds.StatsTableView({ collection: ds.collections.schools })
      @views.scope_table = new ds.StatsTableView({ collection: ds.collections.sites })
    else if @model.namespace = "schools"
      @views.scope_table = new ds.StatsTableView({ collection: ds.collections.schools })
    else
      @views.scope_table = new ds.StatsTableView({ collection: ds.collections.sites })

  template: JST['logbook/templates/dashboard']

  render: ->
    @$el.html @template(@model.toJSON())
    @postRender()
    @

  postRender: ->
    if @views.site_schools_table?
      $("#site-schools-table").html(@views.site_schools_table.render().el)
      @views.site_schools_table.getStats()
    $("#scope-table").html(@views.scope_table.render().el)
    @views.scope_table.getStats()

