class ds.PeopleIndexView extends Backbone.View
  initialize: ->
    @views =
      leaderboard: new ds.PeopleLeaderboardView
        url: ds.apiHelper.urlFor "people_leaderboard"
      table: new ds.IndexTableView
        collection: ds.collections.people
        columns: ds.collections.people.backgrid_columns
        row: ds.RowLinkView
      pagination: new Backgrid.Extension.Paginator
        collection: ds.collections.people

  template: JST['logbook/templates/people_index']

  className: 'people'

  render: ->
    console.log 'rendered index view'
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.leaderboard.renderTo $("#people-leaderboard")
    @$el.find('#people-table').html @views.table.render().el
    @$el.find('#people-pagination').html @views.pagination.render().el

