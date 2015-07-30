class ds.NotesNewView extends Backbone.View
  initialize: (args) ->
    @notable_id = args.notable_id
    @notable_type = args.notable_type
    @notable = args.notable
    @setModel()

  setModel: ->
    @model = new ds.Note
      notable_id: @notable_id
      notable_type: @notable_type

  render: ->
    @$el.html @template(@model.tplAttrs())
    @delegateEvents()
    @

  template: JST['logbook/templates/notes_new']

  tagName: 'form'

  events:
    'submit': 'save'

  save: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.save data
    @notable.set 'notes', @notable.get('notes').push @model
    @notable.save()
    @setModel()

