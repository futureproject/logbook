Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.NewView extends Backbone.View
  initialize: ->
    @listen()

  template: JST['phonebook/templates/engagements/new']

  events:
    'tap .back': 'cancel'
    'tap .done': 'submitForm'
    'tap .attendance': 'takeAttendance'
    'touchmove .detail-title' : (e) -> e.preventDefault()

  cancel: ->
    @model.destroy()
    @animateOut()

  takeAttendance: (e) ->
    Backbone.trigger 'engagements:taking_attendance', @model
    e.gesture.srcEvent.preventDefault()

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
    @animateIn()
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
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()
