Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.SearchResultsView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'search:results', @render
    @item_view = args.item_view

  render: (collection) ->
    @trigger 'clean'
    fragment = document.createDocumentFragment()
    for model in collection.models
      view = new @item_view
        model: model
      view.listenTo @, 'clean', view.remove
      fragment.appendChild view.render().el
    @$el.html(fragment)
    @

  remove: ->
    @trigger 'clean'
    super

