class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/show']

  events:
    'mouseup .back': 'hide'
    'touchend .back': 'hide'
    'swiperight': -> ds.animator.outRight(@)
    'touchmove .detail-title': (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, 'engagements:selected', @show

  show: (model, view) ->
    @model = model
    Backbone.trigger 'engagements:router:update', @model.get('id')
    @listenToOnce @model, 'change:selected', @animateOutToItemView
    @render()
    if view
      @animateInFromItemView(view)
    else
      @showSansAnimation()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model.unset('selected')
    Backbone.trigger 'engagements:router:update', ''
    Backbone.trigger 'engagements:views:hidden', @

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
    @$el.transition
      x: @originalPosition.left
      y: @originalPosition.top
      opacity: 0
      complete: =>
        @$el.removeClass('active')

  showSansAnimation: ->
    @$el.addClass('active')

  render: ->
    @$el.html @template @model.tplAttrs()
    @

