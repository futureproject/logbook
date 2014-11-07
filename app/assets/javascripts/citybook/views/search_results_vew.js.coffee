ds.Views ||= {}
class ds.Views.SearchResultsView extends Backbone.View
  initialize: (args)->
    return unless @el?
    @listenTo Backbone, 'search:complete', @show
    @listenTo Backbone, 'search:clear', @hide
    @listenTo Backbone, 'search:added', @onAdd
    @$table = @$el.find('.search-results')
    @template = args.template

  show: (search) ->
    @$table.prev('tbody').hide()
    htm = ""
    htm += @template({
      first_name: person.first_name
      last_name: person.last_name
      grade: person.grade
      school_name: person.school_name
    }) for person in search.results
    @$table.show().html htm

  hide: ->
    @$table.prev('tbody').show()
    @$table.hide()

  onAdd: (person) ->
    @$table.append @template(person)

