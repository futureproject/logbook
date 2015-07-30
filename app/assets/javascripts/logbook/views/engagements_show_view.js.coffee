class ds.EngagementsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @collections =
      attendees: new ds.PeopleCollection { mode: 'client' }
    @views =
      attendees_table: new ds.IndexTableView
        collection: @collections.attendees
        columns: ds.collections.people.backgrid_columns
      new_note: new ds.NotesNewView
        notable_type: "Engagement"
        notable_id: @model.id
        notable: @model

  template: JST['logbook/templates/engagements_show']

  className: 'engagement profile'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @collections.attendees.reset @model.get('attendees')
    @views.attendees_table.renderTo "#attendees-table" if @collections.attendees.length > 0

    # HACK!!!!!
    @views.new_note.renderTo "#new-note"
    $notes = @$el.find('.notes')
    _.each @model.get('notes'), (note_attrs) ->
      n = new ds.Note(note_attrs)
      $notes.prepend(new ds.NoteView({model: n}).render().el)
