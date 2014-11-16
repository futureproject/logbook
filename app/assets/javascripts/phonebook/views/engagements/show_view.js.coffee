Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/show']

  events:
    'tap .back': 'deselect'
    'swiperight': 'deselect'
    'touchmove .detail-title': (e) -> e.preventDefault()
    'touchmove .detail-content': (e) ->
      e.preventDefault()
      e.stopPropagation()

  listen: ->
    @listenTo Backbone, 'engagements:selected', @onSelect

  onSelect: (model, view) ->
    @model = model
    @listenToOnce @model, 'change:selected', @animateOut
    @render()
    if view
      @animateIn(view)
    else
      @$el.addClass('active')

  deselect: ->
    @model.unset('selected')

  animateIn: (view) ->
    @originalPosition = view.el.getBoundingClientRect()
    @$el.transition
      x: @originalPosition.left,
      y: @originalPosition.top,
      scale: 0.95
      duration: 0
      complete: =>
        @el.classList.add 'active'
        @$el.transition({
          x: @originalPosition.left
          y: 0,
          opacity: 1
          scale: 1
        }, 350)

  animateOut: ->
    @originalPosition ||= { top: '100%', left: 0 }
    Backbone.trigger 'engagements:router:update', ''
    @$el.transition
      x: @originalPosition.left
      y: @originalPosition.top
      opacity: 0
      complete: =>
        @$el.removeClass('active')

  render: ->
    @$el.html @template @model.toJSON()
    @

