class ds.PeopleSpreadsheetView extends Backbone.View
  initialize: ->
    @collection = ds.collections.people
    @views =
      table: new ds.IndexTableView
        collection: @collection
        columns: [
          {name: 'profile', cell: ds.ViewCell, label: "" }
          {name: 'first_name', label: 'First', cell: 'string', editable: true }
          {name: 'last_name', label: 'Last', cell: 'string', editable: true }
          {name: 'dream_team', cell:'boolean', headerCell: ds.AbbreviatedHeaderCell, title: "Dream Team", label: "DT",  editable: true}
          {name: 'future_fellow', cell:'boolean', headerCell: ds.AbbreviatedHeaderCell, title: "Future Fellow", label: "FF",  editable: true}
          {name: 'grade', cell:'integer', editable: true}
          {name: 'email', cell:'string', editable: true}
          {name: 'phone', cell:'string', editable: true}
          {name: 'birthday', cell:'date', editable: true}
          {name: 'ob_media_release', cell:'boolean', headerCell: ds.AbbreviatedHeaderCell, title: "Media Release", label: "R",  editable: true}
          {name: 'ob_disclaimer', cell:'boolean', headerCell: ds.AbbreviatedHeaderCell, title: "Disclaimer", label: "D",  editable: true}
          {name: 'ob_parental_consent', cell:'boolean', headerCell: ds.AbbreviatedHeaderCell, title: "Parental Consent", label: "C",  editable: true}
        ]
      pagination: new ds.BackgridPaginator
        collection: @collection
      filters: new ds.TableFiltersView
        collection: @collection
        template: JST["logbook/templates/people_filters"]

    @listenTo Backbone, 'filters:apply', @applyFilters
    # save people after edit
    @listenTo @collection, 'backgrid:edited', (person) ->
      person.save()

  template: JST['logbook/templates/people_spreadsheet']

  className: 'people spreadsheet'

  events:
    'change .view-style': (event) ->
      val = $(event.currentTarget).val()
      if val == "list"
        path = "/logbook/people"
        ds.router.navigate path, { trigger: true }

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#people-spreadsheet"
    @views.pagination.renderTo '#people-spreadsheet-pagination'
    @views.filters.renderTo "#people-spreadsheet-filters"

  applyFilters: (namespace, data) ->
    return unless namespace == "people"
    @collection.queryParams[filter] = val for filter, val of data
    @views.table.$el.css('opacity','.25')
    @collection.fetch
      reset: true
      complete: =>
        @views.table.$el.css('opacity','1')
