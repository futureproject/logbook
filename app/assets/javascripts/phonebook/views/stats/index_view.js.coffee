Phonebook.Views.Stats ||= {}

class Phonebook.Views.Stats.IndexView extends Backbone.View
  template: JST["phonebook/templates/stats/index"]
  initialize: (args) ->
    @stats = args.stats
    @listenTo Backbone, 'stats:index', @render

  events:
    'touchmove': 'ontouchmove'
    'touchstart': 'ontouchstart'

  ontouchstart: (e) ->
    height = @el.getBoundingClientRect().height
    atTop = @el.scrollTop == 0
    atBottom = (@el.scrollHeight - @el.scrollTop == height)
    if atTop
      @el.scrollTop += 1
    else if atBottom
      @el.scrollTop -= 1

  ontouchmove: (e) ->
    e.stopPropagation()

  render: ->
    @$el.html(@template({ user: Phonebook.USER, stats: @stats }))

