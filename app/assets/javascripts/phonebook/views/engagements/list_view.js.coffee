Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ListView extends Backbone.View
  initialize: (args) ->
    @collection = args?.collection || new Phonebook.Collections.EngagementsCollection
    @listenTo @collection, 'reset add', @render
    @listenTo @collection, 'change:selected', @clearSelection

  render: ->
    @removeItems()
    fragment = document.createDocumentFragment()
    for model in @collection.models
      view = new Phonebook.Views.Engagements.ListItemView
        model: model
      view.listenTo @, 'clean_up', view.remove
      fragment.appendChild view.render().el
    @$el.html fragment

  removeItems: ->
    @trigger 'clean_up'

  clearSelection: (selection) ->
    return unless selection.has('selected')
    selected = @collection.filter (model) -> model.has('selected') && model != selection
    model.unset('selected') for model in selected
    @el.classList.add('active')

  remove: ->
    @removeItems()
    super

class Phonebook.Views.Engagements.ListItemView extends Backbone.View
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  render: ->
    console.log 'rendered an engagement list item'
    @$el.html @template @model.tplAttrs()
    @

  listen: ->
    @listenTo @model, 'change:date change:name change:kind', @render
    @listenTo @model, 'change:selected', @toggleActiveClass

  events:
    'tap' : 'ontap'

  ontap: ->
    @model.set('selected', true)
    Backbone.trigger 'engagements:router:update', @model.get('id')

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass 'selected'
      Backbone.trigger 'engagements:selected', @model, @
      console.log 'engagement selected'
    else
      @$el.removeClass 'selected'
