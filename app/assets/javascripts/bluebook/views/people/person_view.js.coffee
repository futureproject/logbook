Bluebook.Views.People ||= {}

class Bluebook.Views.People.PersonView extends Backbone.View
  template: JST["bluebook/templates/people/person"]

  events:
    "click" : "show"

  #tagName: "li"

  show: () ->
    Bluebook.vent.trigger "people:show", @model
    Bluebook.Routers.people.navigate "/bluebook/people/#{@model.get('id')}"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
