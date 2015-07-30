class ds.NoteView extends Backbone.View
  className: 'note'

  template: JST["logbook/templates/note"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @


