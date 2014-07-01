Bluebook.Views.People ||= {}

class Bluebook.Views.People.ShowView extends Backbone.View
  template: JST["bluebook/templates/people/show"]

  initialize: ->
    @listenTo Backbone, 'people:show', @render

  events:
    'change input' : 'toggleCore'

  render: (model) ->
    @model = model
    @$el.html(@template(@model.toJSON() ))
    return this

  toggleCore: ->
    @model.set("core", !@model.get('core'))
    @model.save()

