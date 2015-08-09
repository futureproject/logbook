class ds.StickiesView extends Backbone.View
  initialize: ->
    @collection = ds.collections.notes
    @views = []

  render: ->
    models = @getNotes()
    fragment = $(document.createDocumentFragment())
    _.each models, (note) =>
      noteView = new ds.NoteView({model: note})
      @views.push noteView
      fragment.append noteView.render().el
    @$el.html fragment
    @

  getNotes: ->
    @collection.where
      notable_id: @model.get('id')
      notable_type: ds.nounsHelper.singularize(@model.namespace).toTitleCase()

