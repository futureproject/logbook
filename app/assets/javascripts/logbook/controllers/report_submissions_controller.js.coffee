class ds.ReportSubmissionsController extends ds.BaseController
  el: "#reports-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "report_submissions:index", @index
    @listenTo Backbone, "report_submissions:show", @show

  index: ->
    ds.collections.report_submissions.fetch()
    @activate()
    @views.index = new ds.ReportSubmissionsIndexView
    @views.index.renderTo @targetEl

  show: (id) ->
    report = @setReportSubmissionFromId(id)
    @views.show = new ds.ReportSubmissionsShowView
      model: report
    @views.show.renderTo @targetEl

  setReportSubmissionFromId: (id) ->
    @activate()
    # check if this is an id or a cid
    uid = if !!parseInt(id) then id else {cid: id}
    report = ds.collections.report_submissions.get(uid)
    report = new ds.ReportSubmission({id: id}) unless report?
    report.fetch()
    report

