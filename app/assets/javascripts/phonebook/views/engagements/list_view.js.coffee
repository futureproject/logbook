Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ListView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection || new Phonebook.Collections.EngagementsCollection
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'change:selected', @clearSelection

  render: ->
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Engagements.ListItemView
        model: model
      fragment.appendChild view.render().el
    @$el.html fragment

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected


class Phonebook.Views.Engagements.ListItemView extends Backbone.View
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  render: ->
    @$el.html @template @model.toJSON()
    @

  listen: ->
    @listenTo @model, 'change:selected', () ->
      @$el.toggleClass('selected', !!@model.get('selected'))

  events:
    'tap' : 'ontap'

  ontap: ->
    @model.set('selected', true)
