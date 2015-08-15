class ds.EngagementsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      attendees: new ds.PeopleCollection { mode: 'client' }
    @views =
      attendees_table: new ds.IndexTableView
        collection: @collections.attendees
        columns: ds.collections.people.backgrid_columns
      stickies: new ds.StickiesView { model: @model }

  template: JST['logbook/templates/engagements_show']

  className: 'engagement profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    return if @model.isNew()
    @collections.attendees.reset @model.get('attendees')
    @views.attendees_table.renderTo "#attendees-table" if @collections.attendees.length > 0
    @views.stickies.collection.add @model.get('notes')
    @views.stickies.renderTo "#stickies"

