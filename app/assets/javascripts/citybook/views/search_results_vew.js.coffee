ds.Views ||= {}
class ds.Views.SearchResultsView extends Backbone.View
  initialize: (args)->
    @listenTo Backbone, 'search:complete', @process
    @$table = $("<table />").insertAfter(@$el).hide()
    @template = args.template

  process: (results) ->
    @results = results
    if @results?
      @show()
    else
      @hide()

  show: ->
    @$el.hide()
    htm = "<tr><th>First</th><th>Last</th><th>Grade</th><th>School</th>"
    htm += @template({
      first_name: person.first_name
      last_name: person.last_name
      grade: person.grade
      school: person.school_name
    }) for person in @results
    @$table.show().html htm

  hide: ->
    @$el.show()
    @$table.hide()
