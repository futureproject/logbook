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

class Phonebook.Views.Engagements.ListItemView extends Backbone.View
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  listen: ->
    @listenTo @model, 'change:date change:name change:kind', @render
    @listenTo @model, 'change:selected', @toggleActiveClass
    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'change:editing', @toggleControls

  events:
    'tap .delete' : 'delete'
    'tap' : 'ontap'
    'swipeleft': -> @model.set('editing', true)
    'swiperight': -> @model.unset('editing')

  ontap: ->
    if @model.has('editing')
      @model.unset('editing')
    else
      @model.set('selected', true)

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass('selected').attr('style','')
      Backbone.trigger 'engagements:selected', @model, @
    else
      @$el.removeClass 'selected'

  toggleControls: ->
    if @model.has('editing') then @showControls() else @hideControls()

  showControls: (e) ->
    @el.classList.add('controls-showing')

  hideControls: (e) ->
    @el.classList.remove('controls-showing')

  delete: (e) ->
    @$el.css({'min-height': '0', overflow: 'hidden', height: @$el.height() + 'px' }).transition({
      height: '0px'
      padding: '0 10px'
      complete: =>
        @model.destroy()
    }, 200)



