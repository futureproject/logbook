Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.AttendanceView extends Backbone.View
  initialize: ->
    @listen()

  template: JST['phonebook/templates/engagements/attendance']

  listen: ->
    @listenTo Backbone, 'engagements:taking_attendance', @show
    @listenTo Backbone, 'engagements:selected', @hide

  events:
    'tap .done': 'animateOut'
    'touchmove .detail-title': (e) -> e.preventDefault()

  show: (model) ->
    @model = model
    Backbone.trigger 'engagements:router:update', "#{@model.get('id')}/attendance"
    @model.set 'taking_attendance', true
    @render()
    @animateIn()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset 'taking_attendance'
    @removeSubviews()
    @$el.removeClass('active').attr('style','')

  render: ->
    @$el.html @template @model.tplAttrs()

  animateIn: ->
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  removeSubviews: ->
    @$form?.remove()

  remove: ->
    @removeSubviews()
    super
