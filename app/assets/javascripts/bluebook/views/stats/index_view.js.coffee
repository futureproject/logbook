Bluebook.Views.Stats ||= {}

class Bluebook.Views.Stats.IndexView extends Backbone.View
  template: JST["bluebook/templates/stats/index"]
  initialize: (args) ->
    @stats = args.stats
    @listenTo Backbone, 'stats:index', @render

  render: ->
    @$el.html(@template({ user: Bluebook.USER, stats: @stats }))

