Dreamos.Views.People ||= {}

class Dreamos.Views.People.IndexView extends Backbone.View
  template: JST["backbone/templates/people/index"]

  initialize: () ->
    @options.people.bind('reset', @addAll)

  addAll: () =>
    @options.people.each(@addOne)

  addOne: (person) =>
    view = new Dreamos.Views.People.PersonView({model : person})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(people: @options.people.toJSON() ))
    @addAll()

    return this
