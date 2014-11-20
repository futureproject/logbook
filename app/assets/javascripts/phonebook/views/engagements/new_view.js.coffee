Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.NewView extends Backbone.View
  initialize: ->
    @model = new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/new']

  events:
    'mouseup .back': 'deselect'
    'touchend .back': 'deselect'
    'tap .done': 'submitForm'
    'swiperight': -> ds.animator.outRight(@)
    'touchmove .detail-title' : (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, 'engagements:new', @show

  show: (event) ->
    Backbone.trigger 'engagements:router:update', 'new'
    @model.set 'selected', true
    @listenToOnce @model, 'change:selected', @hide
    @render()
    if event
      @animateIn()
    else
      @showSansAnimation()
    Backbone.trigger 'engagements:views:shown', @


  deselect: ->
    @model.unset 'selected'

  hide: ->
    Backbone.trigger 'engagements:router:update', ''
    Backbone.trigger 'engagements:views:hidden', @
    @animateOut()
    @form.remove()

  submitForm: (e) ->
    e.stopPropagation()
    @$el.find('form').trigger 'submit'

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Engagements.FormView(
      el: '#new-engagement-form'
      model: @model
    ).render()

  animateIn: ->
    @$el.transition
      x: '0'
      y: '100%'
      duration: 0
      opacity: 0
      complete: =>
        @el.classList.add 'active'
        @$el.transition({
          x: 0,
          y: 0
          opacity: 1
        }, 250)

  animateOut: ->
    @$el.transition
      x: 0
      y: '100%'
      opacity: 0
      complete: =>
        @$el.removeClass('active').attr('style','')

  showSansAnimation: ->
    @$el.addClass('active').attr('style', '')

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @trigger 'cleanup'
