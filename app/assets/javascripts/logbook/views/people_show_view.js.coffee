class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views =
      projects_table: new Backgrid.Grid
        collection: @model.collections.projects
        columns: [
          {name: 'name', cell: ds.LogbookLinkCell }
          {name: 'description', cell: 'string' }
          {name: 'people_count', cell:'integer', label: 'Team Size'}
          {name: 'leading', cell:'boolean'}
        ]
      engagement_bubbles_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("people_graphs", { id: @model.id, graph: "engagement_bubbles_graph" })
      engagements_table: new Backgrid.Grid
        collection: @model.collections.engagements
        columns: @model.collections.engagements.backgrid_columns

  template: JST['logbook/templates/people_show']

  className: 'person profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @model.collections.projects.reset @model.get('projects')
    @model.collections.engagements.reset @model.get('engagements')
    @views.projects_table.renderTo "#projects-table" if @model.collections.projects.length > 0
    @views.engagement_bubbles_graph.renderTo '#engagement_bubbles_graph'
    @views.engagements_table.renderTo "#engagements-table" if @model.collections.engagements.length > 0

