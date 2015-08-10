class ds.NoteView extends Backbone.View
  initialize: ->
    @listenTo @model, 'destroy', @hide

  className: 'sticky'

  template: JST["logbook/templates/note"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @

  events:
    'click .destroy': 'destroy'

  destroy: (event) ->
    if (confirm('Are you sure?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false



