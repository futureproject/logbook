Phonebook.Views.People ||= {}

class Phonebook.Views.People.SelectablePersonView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render

  events:
    'click': 'toggle'

  template: JST['phonebook/templates/people/selectable_person']

  className: -> "row #{@model.className.toLowerCase()} #{'selected' if @model.has('selected')}"

  toggle: ->
    if @model.has('selected')
      @model.set('selected', null)
    else
      @model.set('selected', true)

  render: ->
    @$el.html(@template @model.tplAttrs()).attr('class', @className())
    @
