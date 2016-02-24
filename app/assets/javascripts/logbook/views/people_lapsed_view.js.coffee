class ds.PeopleLapsedView extends Backbone.View
  template: JST["logbook/templates/people_lapsed"]
  initialize: ->
    @collection = new ds.PeopleCollection
    @views =
      table: new ds.IndexTableView
        collection: @collection
        columns:[
          {name: 'first_name', label: 'First', cell: ds.LogbookLinkCell, sortable: false }
          {name: 'last_name', cell: ds.LogbookLinkCell, label: 'Last', sortable: false}
          {name: 'dream_team', cell:'boolean', label: 'DT', sortable: false }
          {name: 'future_fellow', cell:'boolean', label: 'FF', sortable: false }
          {name: 'grade', cell:'integer', sortable: false}
          {name: 'project_people_count', cell:'integer', label: 'Projects', sortable: false }
          {name: 'engagement_attendees_count', cell:'integer', label: 'Engagements', sortable: false }
          {name: 'last_engaged', cell:'date', label: 'Last Engaged', sortable: false}
        ]

  render: ->
    @$el.html @template()
    @toggleVisibility()
    @postRender()
    @

  postRender: ->
    @views.table.renderTo "#lapsed-people-table"
    @getData()

  getData: ->
    $.ajax
      url: ds.apiHelper.urlFor("people_lapsed")
      success: (response) =>
        @collection.reset(response.data)
        @toggleVisibility()

  toggleVisibility: ->
    if @collection.length > 0
      @$el.show()
    else
      @$el.hide()


