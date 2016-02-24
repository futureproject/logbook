class ds.PeopleLapsedView extends Backbone.View
  template: JST["logbook/templates/people_lapsed"]
  initialize: ->
    @collection = new ds.PeopleCollection
    @views =
      table: new ds.IndexTableView
        collection: @collection
        columns:[
          {name: 'first_name', label: 'First', cell: ds.LogbookLinkCell }
          {name: 'last_name', cell: ds.LogbookLinkCell, label: 'Last'}
          {name: 'grade', cell:'integer'}
          {name: 'last_engaged', cell:'date', label: 'Last Engaged'}
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
        @collection.reset(response)
        @toggleVisibility()

  toggleVisibility: ->
    if @collection.length > 0
      @$el.show()
    else
      @$el.hide()


