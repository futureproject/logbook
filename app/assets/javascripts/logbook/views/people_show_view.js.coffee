class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      projects: new ds.ProjectsCollection { mode: 'client' }
    @views =
      projects_table: new Backgrid.Grid
        collection: @collections.projects
        columns: [
          {name: 'name', cell: ds.LogbookLinkCell }
          {name: 'description', cell: 'string' }
          {name: 'size', cell:'integer', label: 'Team Size'}
          {name: 'leading', cell:'boolean'}
        ]
      engagement_bubbles_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("people_graphs", { id: @model.id, graph: "engagement_bubbles_graph" })

  template: JST['logbook/templates/people_show']

  className: 'person profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @collections.projects.reset @model.get('projects')
    if @collections.projects.length > 0
      @views.projects_table.renderTo "#projects-table"
    @views.engagement_bubbles_graph.renderTo '#engagement_bubbles_graph'

