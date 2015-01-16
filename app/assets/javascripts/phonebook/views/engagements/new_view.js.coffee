Phonebook.Views.Engagements ||= {}
class Phonebook.Views.Engagements.NewView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @model = new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/new']

  className: 'detail detail-new'

  events:
    'tap .back': 'cancel'
    'tap .done': 'submitForm'
    'touchmove .detail-title' : (e) -> e.preventDefault()

  cancel: ->
    @model.destroy()
    @hide()
    Backbone.trigger 'engagements:index'

  takeAttendance: (e) ->
    Backbone.trigger 'engagements:taking_attendance', @model
    e.gesture.srcEvent.preventDefault()

  listen: ->
    @listenTo @model, 'change', @render

  show: (animation) ->
    animation ||= 'slide-in-vertical'
    @$container.append @$el.addClass(animation)
    @render()
    Backbone.trigger 'engagements:router:update', 'new'
    Backbone.trigger 'engagements:views:shown', 'modal'

  hide: ->
    @$el.addClass('hiding').one('webkitAnimationEnd', () =>
      @remove()
    )
    Backbone.trigger('engagements:views:hidden', @)

  submitForm: (e) ->
    e.stopPropagation()
    @$el.find('form').trigger 'submit'
    @hide()

  render: ->
    @$el.html @template @model.tplAttrs()
    @form = new Phonebook.Views.Engagements.FormView(
      el: '#new-engagement-form'
      model: @model
    ).render()

  remove: ->
    @removeSubviews()
    super

  removeSubviews: ->
    @form?.remove()
