Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.ModelView extends Backbone.View
  initialize: (args) ->
    @template = args.template || JST['phonebook/templates/base/model']
    @render()
    @listenTo @model, 'change', @render

  render: ->
    @$el.html(@template @model.tplAttrs())

