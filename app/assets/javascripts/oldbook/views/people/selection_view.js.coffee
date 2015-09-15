Phonebook.Views.People ||= {}

class Phonebook.Views.People.SelectionView extends Backbone.View
  initialize: (args) ->
    @association = args.association
    @listenTo @model[@association], "add", @render
    @listenTo Backbone, "result:selected", @addPerson
    @render()

  render: ->
    fragment = document.createDocumentFragment()
    for model in @model[@association].models
      model.set('selected', true)
      view = new Phonebook.Views.People.SelectablePersonView
        model: model
      view.listenTo @, 'clean', view.remove
      fragment.appendChild view.render().el
    @$el.html(fragment)
    @

  remove: ->
    @trigger 'clean'
    super

  addPerson: (person) ->
    @model[@association].remove person
    @model[@association].add person,
      merge: true
      at: 0

