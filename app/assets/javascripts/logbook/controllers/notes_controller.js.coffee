class ds.NotesController extends Backbone.View
  initialize: ->
    @listenTo Backbone, "notes:new", @addNote

  addNote: (args) ->
    throw "Needs a notable" unless args?.notable_type && args?.notable_id
    note = new ds.Note
      notable_id: args.notable_id
      notable_type: args.notable_type
    #view = new ds.NotesNewView
      #mode: note
    #view.renderTo args.target
    console.log note

