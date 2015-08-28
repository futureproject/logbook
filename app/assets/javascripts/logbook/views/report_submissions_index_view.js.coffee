class ds.ReportSubmissionsIndexView extends Backbone.View
  initialize: ->
    @views =
      table: new ds.IndexTableView
        collection: ds.collections.report_submissions
        columns: ds.collections.report_submissions.backgrid_columns
      #pagination: new Backgrid.Extension.Paginator
        #collection: ds.collections.report_submissions

  template: JST['logbook/templates/report_submissions_index']

  className: 'reports'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#report-submissions-table"
    @renderSubmissionsLink() if ds.current_user.get('role').match(/admin|chief/i)

  renderSubmissionsLink: ->
    console.log "!!"
    @$el.find('#reports-submitted-link-container').html "
      <div class='footerbar'>
        <nav class='r'>
          <a href='http://go.dream.org/reports'>View Submitted Reports</a>
        </nav>
      </div>
    "

