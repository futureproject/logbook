class ds.NotesFormView extends Backbone.View
  initialize: ->
    @views = {}

  tagName: 'form'
  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/notes_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.save data
    notable = @model.getNotable()
    notable.collections?.notes?.add @model
    ds.router.navigate ds.urlsHelper.urlFor(notable), {trigger: true}

