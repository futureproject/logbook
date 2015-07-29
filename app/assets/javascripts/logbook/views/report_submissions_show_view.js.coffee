class ds.ReportSubmissionsShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views = {}

  events:
    'click .save': 'save'
    'click .submit': 'submit'

  template: JST['logbook/templates/report_submissions_show']

  className: 'report-submissions show'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->

  getBodyFromTextEditor: -> { body: @el.querySelector('textarea').value.trim() }

  save: (event) ->
    event.preventDefault()
    data = @getBodyFromTextEditor()
    data = _.extend(data, {status: "In Progress"}) if @model.get('status') == "Unread"
    @model.save data, {silent: true}
    true

  submit: (event) ->
    event.preventDefault()
    data = @getBodyFromTextEditor()
    @model.save (_.extend data, {status: "Submitted"}), { silent: true }
    true

