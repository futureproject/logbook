class ds.EngagementsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      attendees: new ds.PeopleCollection { mode: 'client' }
      projects: new ds.ProjectsCollection { mode: 'client' }
    @views =
      attendees_table: new ds.IndexTableView
        collection: @collections.attendees
        columns: ds.collections.people.backgrid_columns
      stickies: new ds.StickiesView { model: @model }
      projects_table: new Backgrid.Grid
        collection: @collections.projects
        columns: @collections.projects.backgrid_columns

  template: JST['logbook/templates/engagements_show']

  events:
    'click .duplicate': 'duplicate'

  className: 'engagement profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    return if @model.isNew()
    @collections.attendees.reset @model.get('attendees')
    @collections.projects.reset @model.get('projects')
    @views.projects_table.renderTo "#projects-table" if @collections.projects.length > 0
    @views.attendees_table.renderTo "#attendees-table" if @collections.attendees.length > 0
    @views.stickies.collection.add @model.get('notes')
    @views.stickies.renderTo "#stickies"

  duplicate: (click_event) ->
    click_event.preventDefault()
    data = _.omit(_.clone(@model.attributes), 'id', 'date')
    data.name += " (Remix)" unless data.name.match(/remix/i)
    dup = new ds.Engagement
    if dup.save data
      ds.collections.engagements.add dup, { merge: true }
      ds.router.navigate ds.urlsHelper.urlFor(dup), {trigger: true}
      dup.once 'change:id', =>
        ds.router.navigate ds.urlsHelper.urlFor(dup), { trigger: true, replace: true }

