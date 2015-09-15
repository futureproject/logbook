class ds.ReportSubmissionsController extends ds.BaseController
  el: "#reports-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "reports:assigned", @assigned
    @listenTo Backbone, "reports:submitted", @submitted
    @listenTo Backbone, "reports:view", @view

  assigned: ->
    ds.collections.report_submissions.fetch()
    @activate()
    @views.index = new ds.ReportsAssignedView
    @views.index.renderTo @targetEl

  submitted: ->
    @activate()
    @submissions ||= new ds.ReportsSubmittedCollection
    @submissions.fetch()
    @views.submitted = new ds.ReportsSubmittedView
      collection: @submissions
    @views.submitted.renderTo @targetEl

  view: (id) ->
    report = @setReportSubmissionFromId(id)
    pid = report.get("person_id")
    console.log pid
    if pid == ds.current_user.id || !pid?
      @views.view = new ds.ReportSubmissionsEditView
        model: report
    else
      @views.view = new ds.ReportSubmissionsReadView
        model: report
    @views.view.renderTo @targetEl

  setReportSubmissionFromId: (id) ->
    @activate()
    # check if this is an id or a cid
    uid = if !!parseInt(id) then id else {cid: id}
    report = ds.collections.report_submissions.get(uid) || @submissions?.get(uid)
    report = new ds.ReportSubmission({id: id}) unless report?
    report.fetch()
    report

