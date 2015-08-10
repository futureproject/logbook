class ds.NoteView extends Backbone.View
  initialize: ->
    @listenTo @model, 'destroy', @animateOut

  className: 'sticky'

  template: JST["logbook/templates/note"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @

  events:
    'click .delete': 'delete'
    'click .edit': 'enterEditMode'
    'click .done': 'exitEditMode'

  delete: (event) ->
    if (confirm('Are you sure you want to delete this note?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

  animateOut: ->
    @$el.animate {
      opacity: 0
    }, => @hide()

  enterEditMode: ->
    @$el.addClass('editing')
    @$el.find('.note-text').attr('contenteditable', 'true').focus()

  exitEditMode: ->
    @$el.removeClass('editing')
    text = @$el.find('.note-text').removeAttr('contenteditable').html()
    @model.save { content: text }
