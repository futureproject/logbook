class ds.ProfileView extends Backbone.View
  initialize: (args) ->
    @template = args.template
    @listenTo @model, 'change', @render

  events:
    'change #avatar-uploader': 'uploadAvatar'

  render: ->
    @$el.html(@template @model.tplAttrs())
    @delegateEvents()
    @

  uploadAvatar: (event) ->
    event.stopPropagation()
    file = event.currentTarget.files[0]
    new ds.UploaderView
      attachable: @model
      file: file
    @listenToOnce @model, "upload:finished", @processUpload

  processUpload: (url) ->
    @model.set 'avatar_url', url

