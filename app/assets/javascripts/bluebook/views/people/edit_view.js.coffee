Bluebook.Views.People ||= {}

class Bluebook.Views.People.EditView extends Backbone.View
  template : JST["bluebook/templates/people/edit"]

  initialize: ->
    @listenTo Backbone, 'people:edit', @show

  events :
    "submit #edit-person" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (person) =>
        Backbone.trigger 'people:show', person
    )

  show: (model) ->
    @model = model
    Backbone.trigger 'route:go', "/bluebook/people/#{@model.get('id')}/edit"
    @render()

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
