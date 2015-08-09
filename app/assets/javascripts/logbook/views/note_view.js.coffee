class ds.NoteView extends Backbone.View
  className: 'sticky'

  template: JST["logbook/templates/note"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @


