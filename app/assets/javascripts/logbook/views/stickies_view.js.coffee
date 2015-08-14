class ds.StickiesView extends Backbone.View
  initialize: ->
    @collection = new ds.NotesCollection
    @views = []

  render: ->
    fragment = $(document.createDocumentFragment())
    @collection.each (note) =>
      noteView = new ds.StickyView({model: note})
      @views.push noteView
      fragment.append noteView.render().el
      assets = note.get('assets')
    @$el.html fragment
    @

