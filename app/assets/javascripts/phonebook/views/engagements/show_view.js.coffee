Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/show']

  events:
    'tap .back': 'deselect'
    'swiperight': 'animateOutRight'
    'touchmove .detail-title': (e) -> e.preventDefault()
    'touchmove .detail-content': (e) ->
      e.preventDefault()
      e.stopPropagation()
      #TODO
      #only block scrolling when list is at top or at bottom

  listen: ->
    @listenTo Backbone, 'engagements:selected', @onSelect

  onSelect: (model, view) ->
    @model = model
    @listenToOnce @model, 'change:selected', @animateOutToItemView
    @render()
    if view
      @animateInFromItemView(view)
    else
      @showSansAnimation()

  deselect: ->
    @model.unset('selected')

  animateInFromItemView: (view) ->
    @originalPosition = view.el.getBoundingClientRect()
    @$el.transition
      x: @originalPosition.left,
      y: @originalPosition.top,
      duration: 0
      complete: =>
        @el.classList.add 'active'
        @$el.transition({
          x: @originalPosition.left
          y: 0,
          opacity: 1
        }, 350)

  animateOutToItemView: ->
    @originalPosition ||= { top: '100%', left: 0 }
    Backbone.trigger 'engagements:router:update', ''
    @$el.transition
      x: @originalPosition.left
      y: @originalPosition.top
      opacity: 0
      complete: =>
        @$el.removeClass('active')

  animateOutRight: ->
    @$el.transition
      x: '100%'
      y: 0
      opacity: 0
      complete: =>
        @deselect()

  showSansAnimation: ->
    @$el.addClass('active')

  render: ->
    @$el.html @template @model.tplAttrs()
    @

