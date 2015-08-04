class ds.NotesNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Note
    @views =
      form: new ds.NotesFormView
        model: @model

  template: JST['logbook/templates/notes_new']

  className: 'note new'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#note-form"
    @views.form.$el.find('textarea').first().focus()

