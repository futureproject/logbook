Phonebook.Views.People ||= {}

class Phonebook.Views.People.SelectionView extends Backbone.View
  initialize: (args) ->
    @selection = args.selection
    @association = args.association
    @listenTo @model, "change:#{@association}", @render
    @render()

  render: ->
    fragment = document.createDocumentFragment()
    for model in @selection.models
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
