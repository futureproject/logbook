class ds.NoteView extends Backbone.View
  template: JST["logbook/templates/note"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @
