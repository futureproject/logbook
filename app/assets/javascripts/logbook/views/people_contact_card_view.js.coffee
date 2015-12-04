class ds.PeopleContactCardView extends Backbone.View
  tagName: 'form'
  className: 'form'
  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

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
    @setSchoolOptions()
    Backbone.Syphon.deserialize @, @model.toJSON()

  saveBio: (event) ->
    content = $(event.currentTarget).val()
    content = null if content.length < 1
    @model.save
      description: content

  uploadAvatar: (event) ->
    file = event.currentTarget.files[0]
    new ds.AssetUploaderView
      attachable: @model
      file: file

    @listenToOnce @model, "upload:finished", @processUpload

  processUpload: (url) -> @model.set 'avatar', url

  setSchoolOptions: ->
    fragment = document.createDocumentFragment()
    $f = $(fragment)
    $f.append "<option value></option>"
    ds.collections.schools.each (s) ->
      $f.append "<option value='#{s.get('id')}'>#{s.get('name')}</option>"
    @$el.find('#school_id').html $f

