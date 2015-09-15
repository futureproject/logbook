class ds.ReportSubmissionsReadView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views = {}

  template: JST['logbook/templates/report_submissions_read']

  className: 'report-submissions read'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->

