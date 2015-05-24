Phonebook.Views.People ||= {}

class Phonebook.Views.People.SelectionView extends Backbone.View
  initialize: (args) ->
    @association = args.association
    @collection = args.collection
    @listenTo @model, "change:#{@association}", @render
    @render()

  render: ->
    @collection.reset @model.get(@association)
    fragment = document.createDocumentFragment()
    for model in @collection.models
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
