class ds.PeopleIndexView extends Backbone.View
  initialize: ->
    @views =
      table: new ds.StatsTableView
        collection: ds.collections.people
        columns: ds.collections.people.backgrid_columns

  template: JST['logbook/templates/people_index']

  className: 'people'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    # activate tables
    @$el.find('#people-table').html @views.table.render().el

