Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ListView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection || new Phonebook.Collections.EngagementsCollection
    @listenTo @collection, 'change:selected', @clearSelection
    @listenTo @collection, 'reset add', @render

  render: ->
    console.log "rendered engagements index with #{@collection.length} models"
    @removeItems()
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Engagements.ListItemView
        model: model
      view.listenTo @, 'cleanup', view.remove
      fragment.appendChild view.render().el
    @$el.html fragment
    # prevent iOS scroll bounce before any interactions occur
    @el.scrollTop = 1 if @el.scrollTop == 0

  removeItems: ->
    @trigger 'cleanup'

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected

  remove: ->
    @removeItems()
    super

