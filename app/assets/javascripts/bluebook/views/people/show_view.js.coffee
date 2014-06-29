Bluebook.Views.People ||= {}

class Bluebook.Views.People.ShowView extends Backbone.View
  template: JST["bluebook/templates/people/show"]

  initialize: ->
    @listenTo Bluebook.vent, 'people:show', @render

  render: (model) ->
    @model = model
    $(@el).html(@template(@model.toJSON() ))
    return this
