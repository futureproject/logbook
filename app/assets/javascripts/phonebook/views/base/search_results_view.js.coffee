Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchResultsView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'search:results', @render

  render: (collection) ->
    @trigger 'clean'
    fragment = document.createDocumentFragment()
    for model in collection.models
      view = new Phonebook.Views.People.SelectablePersonView
        model: model
      view.listenTo @, 'clean', view.remove
      fragment.appendChild view.render().el
    @$el.html(fragment)
    @

  remove: ->
    @trigger 'clean'
    super
