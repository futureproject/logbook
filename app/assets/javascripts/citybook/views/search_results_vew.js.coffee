ds.Views ||= {}
class ds.Views.SearchResultsView extends Backbone.View
  initialize: (args)->
    return unless @el?
    @listenTo Backbone, 'search:complete', @show
    @listenTo Backbone, 'search:clear', @hide
    @listenTo Backbone, 'search:added', @onAdd
    @listenTo Backbone, 'search:flash', @flash
    @$table = @$el.find('.search-results')
    @template = args.template

  show: (search) ->
    @$el.find('.rails-results').hide()
    htm = ""
    htm += @template({
      first_name: person.first_name
      last_name: person.last_name
      grade: person.grade
      school_name: person.school_name
      id: person.id
    }) for person in search.results
    @$table.show().html htm

  hide: ->
    @$el.find('.rails-results').show()
    @$table.hide()

  onAdd: (person) ->
    @$table.append @template(person)

  flash: (message) ->
    @$table.html "<div class='success notice'>#{message}</div>"

