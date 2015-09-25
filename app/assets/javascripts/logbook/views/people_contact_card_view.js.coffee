class ds.PeopleContactCardView extends Backbone.View
  template: JST['logbook/templates/people_contact_card']

  events:
    'blur textarea': 'saveBio'
    'change #avatar-uploader': 'uploadAvatar'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @delegateEvents()

  saveBio: (event) ->
    content = $(event.currentTarget).val()
    content = null if content.length < 1
    @model.save
      bio: content

  uploadAvatar: (event) ->
    file = event.currentTarget.files[0]
    new ds.AssetUploaderView
      attachable: @model
      file: file

    @listenToOnce @model, "upload:finished", @processUpload

  processUpload: (url) -> @model.set 'avatar', url

