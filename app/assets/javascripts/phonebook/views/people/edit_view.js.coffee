Phonebook.Views.People ||= {}

class Phonebook.Views.People.EditView extends Backbone.View
  template : JST["phonebook/templates/people/edit"]

  initialize: ->
    @listenTo Backbone, 'people:edit', @show

  events :
    "submit #edit-person" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    data = Backbone.Syphon.serialize @
    @model.save(data,
      success : (person) =>
        Backbone.trigger 'people:edited', person
        Backbone.trigger 'people:show', person
    )

  show: (model) ->
    @model = model
    Backbone.trigger 'peopleRouter:go', "/phonebook/people/#{@model.get('id')}/edit"
    @render()
    Backbone.Syphon.deserialize @, @model.attributes

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    return this
