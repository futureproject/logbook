class ds.NotesFormView extends Backbone.View
  initialize: ->
    @views =
      uploader: new ds.UploaderView
    @listenTo Backbone, 'upload:finished', @addAsset

  tagName: 'form'
  className: 'form'
  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/notes_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.uploader.setElement "#assets"
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    spinner = new ds.SpinnerView
    @$el.append spinner.el
    data = Backbone.Syphon.serialize @
    notable = @model.getNotable()
    @model.save data,
      error: (msg) ->
        console.log msg
      complete: ->
        spinner.remove()
        ds.router.navigate ds.urlsHelper.urlFor(notable), {trigger: true}

  addAsset: (asset_url) ->
    assets = @model.get('assets')
    assets.push { attachable_type: "Note", external_url: asset_url }
    @model.set 'assets', assets
