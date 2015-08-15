class ds.ProjectsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      people: new ds.PeopleCollection { mode: 'client' }
    @views =
      people_table: new ds.IndexTableView
        collection: @collections.people
        columns: [
          {name: 'first_name', label: 'First', cell: ds.LogbookLinkCell }
          {name: 'last_name', cell: ds.LogbookLinkCell, label: 'Last'}
          {name: 'role', cell:'string'}
          {name: 'dream_team', cell:'boolean', label: 'Dream Team'}
          {name: 'grade', cell:'integer'}
          {name: 'projects_count', cell:'integer', label: 'Projects'}
          {name: 'engagements_count', cell:'integer', label: 'Engagements'}
          {name: 'leading', cell:'boolean'}
        ]
      stickies: new ds.StickiesView { model: @model }

  template: JST['logbook/templates/projects_show']

  className: 'project profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    return if @model.isNew()
    @collections.people.reset @model.get('people')
    @views.people_table.renderTo "#people-table" if @collections.people.length > 0
    @views.stickies.collection.add @model.get('notes')
    @views.stickies.renderTo "#stickies"

