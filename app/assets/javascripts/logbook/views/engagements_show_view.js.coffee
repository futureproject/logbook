class ds.EngagementsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      attendees: new ds.PeopleCollection { mode: 'client' }
    @views =
      attendees_table: new ds.IndexTableView
        collection: @collections.attendees
        columns: ds.collections.people.backgrid_columns

  template: JST['logbook/templates/engagements_show']

  className: 'engagement profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @collections.attendees.reset @model.get('attendees')
    @views.attendees_table.renderTo "#attendees-table" if @collections.attendees.length > 0

