class ds.NotesNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Note
    @views =
      form: new ds.NotesFormView
        model: @model

  template: JST['logbook/templates/notes_new']

  className: 'note new modal-container fade-in'

  events:
    'click .cancel': 'cancel'
    'click': 'conditionallyCancel'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    $('#yield').append @el
    @$el.fadeIn 'fast'
    @views.form.renderTo "#note-form"
    @views.form.$el.find('textarea').first().focus()

  cancel: ->
    val = @$el.find('textarea').val()
    msg = "Are you sure you want to close this note without saving?"
    canCancel = (val.length == 0 || confirm(msg))
    return unless canCancel
    notable = @model.getNotable()
    triggerCondition = !notable.has('created_at')
    returnPath = ds.urlsHelper.urlFor(@model.getNotable())
    ds.router.navigate returnPath, trigger: triggerCondition
    @$el.fadeOut 'fast', => @hide()

  conditionallyCancel: (event) ->
    @cancel() if event.target.className.match(/modal-container/i)
