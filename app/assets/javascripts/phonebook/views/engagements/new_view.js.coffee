Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.NewView extends Backbone.View
  initialize: ->
    @listen()

  template: JST['phonebook/templates/engagements/new']

  events:
    'tap .back': 'animateOut'
    'tap .done': 'submitForm'
    'swiperight': -> ds.animator.outRight(@)
    'touchmove .detail-title' : (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, 'engagements:new', @show
    @listenTo Backbone, 'engagements:saved', @hide
    @listenTo Backbone, 'engagements:selected', @hide

  show: (event) ->
    return if @model?.has('new')
    @model = new Phonebook.Models.Engagement
    Backbone.trigger 'engagements:router:update', 'new'
    @model.set 'new', true
    @render()
    if event
      @animateIn()
    else
      @showSansAnimation()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset('new')
    @removeSubviews() # remove associated subviews
    @$el.removeClass('active').attr('style','') #reset CSS styles

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
        }, 350, 'ease')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.transition
      x: 0
      y: '100%'
      opacity: 0
      complete: =>
        @hide()

  showSansAnimation: ->
    @$el.addClass('active').attr('style', '')

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()
