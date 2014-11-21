Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ListView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection || new Phonebook.Collections.EngagementsCollection
    @listenTo @collection, 'reset add', @render
    @listenTo @collection, 'change:selected', @clearSelection

  show: -> @$el.addClass 'active'
  hide: -> @$el.removeClass 'active'

  render: ->
    @removeItems()
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Engagements.ListItemView
        model: model
      view.listenTo @, 'cleanup', view.remove
      fragment.appendChild view.render().el
    @$el.html fragment

  removeItems: ->
    @trigger 'cleanup'

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected
    @el.classList.add('active')

  remove: ->
    @removeItems()
    super

