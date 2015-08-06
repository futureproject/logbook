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
    notable = @model.getNotable()
    @model.save data,
      error: (msg) ->
        console.log msg
      complete: ->
        ds.router.navigate ds.urlsHelper.urlFor(notable), {trigger: true}

