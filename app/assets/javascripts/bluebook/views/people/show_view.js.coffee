Bluebook.Views.People ||= {}

class Bluebook.Views.People.ShowView extends Backbone.View
  template: JST["bluebook/templates/people/show"]

  initialize: ->
    @listenTo Backbone, 'people:show', @render

  render: (model) ->
    @model = model
    @$el.html(@template(@model.toJSON() ))
    return this

  addActiveClass: ->
    @$el.addClass 'is_active'
