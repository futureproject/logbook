class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      projects: new ds.ProjectsCollection { mode: 'client' }
      engagements: new ds.EngagementsCollection { mode: 'client' }
    @views =
      contact_card: new ds.PeopleContactCardView { model: @model }
      projects_table: new Backgrid.Grid
        collection: @collections.projects
        columns: [
          {name: 'name', cell: ds.LogbookLinkCell }
          {name: 'description', cell: 'string' }
          {name: 'project_people_count', cell:'integer', label: 'Team Size'}
          {name: 'leading', cell:'boolean'}
        ]
      stickies: new ds.StickiesView { model: @model }
      engagement_bubbles_graph: new ds.GraphView
        url: ds.apiHelper.urlFor("people_graphs", { id: @model.id, graph: "engagement_bubbles_graph" })
      engagements_table: new Backgrid.Grid
        collection: @collections.engagements
        columns: @collections.engagements.backgrid_columns

  template: JST['logbook/templates/people_show']

  className: 'person profile'

  events:
    'click .destroy': 'destroy'


  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    return if @model.isNew()
    @collections.projects.reset @model.get('projects')
    @collections.engagements.reset @model.get('engagements')
    @views.stickies.collection.reset @model.get('notes')
    @views.contact_card.renderTo "#person-contact-card"
    @views.projects_table.renderTo "#projects-table" if @collections.projects.length > 0
    @views.stickies.renderTo "#stickies"
    @views.engagement_bubbles_graph.renderTo '#engagement_bubbles_graph'
    @views.engagements_table.renderTo "#engagements-table" if @collections.engagements.length > 0

  destroy: (event) ->
    if (confirm('Are you sure you want to delete this person?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

