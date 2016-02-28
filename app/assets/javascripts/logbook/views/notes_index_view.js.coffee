class ds.NotesIndexView extends Backbone.View
  initialize: ->
    @collection = ds.collections.notes
    @views =
      gallery: new ds.NotesGalleryView
        collection: @collection

  template: JST["logbook/templates/notes_index"]

  render: ->
    @$el.html(@template())
    @postRender()
    @

  postRender: ->
    @views.gallery.renderTo "#notes-gallery"
