class ds.NotesGalleryView extends Backbone.View
  initialize: (args={})->
    @collection = args.collection
    @listenTo @collection, 'add', @addNotes
    @listenTo @collection, 'reset', @render

  render: ->
    fragment = document.createDocumentFragment()
    @renderNote(note, fragment) for note in @collection.models
    @$el.html(fragment)

  renderNote: (note, fragment)->
    view = new ds.NoteView
      model: note
    fragment.appendChild(view.render().el)

  addNotes: ->
    console.log "add notes to the collection"

