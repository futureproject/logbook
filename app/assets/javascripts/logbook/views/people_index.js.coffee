class ds.PeopleIndexView extends Backbone.View
  initialize: ->
    @views =
      table: new ds.StatsTableView
        collection: ds.collections.people
        columns: ds.collections.people.backgrid_columns
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.people

  template: JST['logbook/templates/people_index']

  className: 'people'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @$el.find('#people-table').html @views.table.render().el
    @$el.find('#people-pagination').html @views.pagination.render().el

  events:
    'scroll': 'loadMore'

  loadMore: (e) ->
    console.log e

