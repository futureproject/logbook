Bluebook.Views.People ||= {}

class Bluebook.Views.People.IndexView extends Backbone.View
  template: JST["bluebook/templates/people/index"]

  initialize: (options) ->
    @listenTo Bluebook.vent, 'people:reset', @render
  #  @options = options
  #  @options.people.bind('reset', @addAll)

  addAll: (collection) =>
    collection.each(@addOne)

  addOne: (person) =>
    view = new Bluebook.Views.People.PersonView({model : person})
    @fragment.appendChild(view.render().el)

  render: (collection) ->
    @fragment = document.createDocumentFragment()
    @$el.html(@template(people: collection.toJSON() ))
    @addAll(collection)
    @el.querySelector('.list').appendChild(@fragment)

    return this
