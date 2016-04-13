class ds.ReportSubmissionsEditView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views = {}

  events:
    'click .save': 'save'
    'click .submit': 'submit'
    'change #assets': 'uploadAttachments'

  template: JST['logbook/templates/report_submissions_edit']

  className: 'report-submissions show'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @editor = new Quill "#report-body",
      modules:
        "toolbar": { container: "#basic-toolbar" }

  getBodyFromTextEditor: ->
    body = @editor.getHTML()
    { body: body }

  save: (event) ->
    event.preventDefault()
    event.stopPropagation()
    data = @getBodyFromTextEditor()
    @model.save data,
      silent: true
      success: ->
        ds.router.navigate "/logbook/reports", { trigger: true }
      error: (error) ->
        msg = "The report failed to save. Please try again."
        msg += " #{error}"
        alert msg

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()
    data = @getBodyFromTextEditor()
    @model.save (_.extend data, {status: "Submitted"}),
      silent: true
      success: ->
        ds.router.navigate "/logbook/reports", { trigger: true }
      error: (error) ->
        msg = "The report failed to save. Please try again."
        msg += " #{error}"
        alert msg

  uploadAttachments: (event) ->
    @upload(file) for file in event.currentTarget.files

  upload: (file) ->
    new ds.AssetUploaderView
      attachable: @model
      file: file

    #@listenToOnce @model, "upload:finished", @processUpload
