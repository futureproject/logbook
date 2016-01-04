class ds.ProjectsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      people: new ds.PeopleCollection { mode: 'client' }
      engagements: new ds.EngagementsCollection { mode: 'client' }
    @views =
      people_table: new ds.IndexTableView
        collection: @collections.people
        columns: [
          {name: 'first_name', label: 'First', cell: ds.LogbookLinkCell }
          {name: 'last_name', cell: ds.LogbookLinkCell, label: 'Last'}
          {name: 'role', cell:'string'}
          {name: 'dream_team', cell:'boolean', label: 'Dream Team'}
          {name: 'grade', cell:'integer'}
          {name: 'project_people_count', cell:'integer', label: 'Projects'}
          {name: 'engagement_attendees_count', cell:'integer', label: 'Engagements'}
          {name: 'leading', cell:'boolean'}
        ]
      stickies: new ds.StickiesView { model: @model }
      engagements_table: new Backgrid.Grid
        collection: @collections.engagements
        columns: @collections.engagements.backgrid_columns


  template: JST['logbook/templates/projects_show']

  className: 'project profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    return if @model.isNew()
    @collections.people.reset @model.get('people')
    @collections.engagements.reset @model.get('engagements')
    @views.people_table.renderTo "#people-table" if @collections.people.length > 0
    @views.stickies.collection.add @model.get('notes')
    @views.stickies.renderTo "#stickies"
    @views.engagements_table.renderTo "#engagements-table" if @collections.engagements.length > 0

