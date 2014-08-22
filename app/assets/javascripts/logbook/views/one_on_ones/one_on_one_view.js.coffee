dream.Views.OneOnOnes ||= {}

class dream.Views.OneOnOnes.OneOnOneView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'destroy', @remove

  template: JST['logbook/templates/one_on_ones/one_on_one']

  className: 'one_on_one'

  tagName: 'tr'

  events:
    'click': 'confirmDestroy'

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  confirmDestroy: ->
    return unless confirm("Do you want to delete this one-on-one?")
    @model.destroy()
