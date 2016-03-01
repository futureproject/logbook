class ds.NotesController extends Backbone.View
  initialize: ->
    @listenTo Backbone, "notes:new", @new

  new: (notable_type, notable_id) ->
    note = new ds.Note
      notable_id: notable_id
      notable_type: notable_type
    @views.new = new ds.NotesNewView
      model: note
    @views.new.render()

