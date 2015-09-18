class ds.ReportSubmissionsEditView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views = {}

  events:
    'click .save': 'save'
    'click .submit': 'submit'

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
    data = @getBodyFromTextEditor()
    @model.save data, {silent: true}
    true

  submit: (event) ->
    event.preventDefault()
    data = @getBodyFromTextEditor()
    @model.save (_.extend data, {status: "Submitted"}), { silent: true }
    true

