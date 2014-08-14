dream.Views.Stats ||= {}

class dream.Views.Stats.StatView extends Backbone.View
  initialize: (args) ->
    @model = args.model

  template: JST['logbook/templates/stats/stat']

  tagName: 'tr'

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

