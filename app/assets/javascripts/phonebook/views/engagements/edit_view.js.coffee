Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.EditView extends Backbone.View
  initialize: (args) ->
    @listen()

  template: JST['phonebook/templates/engagements/edit']

  events:
    'tap .back': 'animateOut'
    'tap .done': 'submitForm'
    'swiperight': -> ds.animator.outRight(@)
    'touchmove .detail-title' : (e) -> e.preventDefault()

  listen: ->
    @listenTo Backbone, 'engagements:editing', @show
    @listenTo Backbone, 'engagements:saved', @hide
    @listenTo Backbone, 'engagements:selected', @hide

  show: (model, prevView) ->
    return if @model?.has('editing')
    @model = model
    Backbone.trigger 'engagements:router:update', "#{@model.get('id')}/edit"
    @model.set 'editing', true
    @render()
    if prevView
      @animateIn()
    else
      @showSansAnimation()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset('editing')
    @removeSubviews() # remove associated subviews
    @$el.removeClass('active').attr('style','') #reset CSS styles

  submitForm: (e) ->
    e.stopPropagation()
    @$el.find('form').trigger 'submit'

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Engagements.FormView(
      el: '#edit-engagement-form'
      model: @model
    ).render()

  animateIn: ->
    @el.classList.add 'active'
    @$el.css('opacity', 0)
    @$el.transition({
      opacity: 1
    }, 350, 'easeOutExpo')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.transition
      opacity: 0
      complete: =>
        @hide()

  showSansAnimation: ->
    @el.classList.add('active')
    @el.setAttribute 'style', ''

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()
