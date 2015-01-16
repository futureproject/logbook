Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/show']

  className: 'detail detail-show'

  events:
    'tap .back': 'back'
    'swiperight': 'back'
    'tap .edit': -> Backbone.trigger 'engagements:edit', @model
    'tap .upload': 'showUploads'
    'tap .attendance': 'showAttendance'
    'touchmove .detail-title': (e) -> e.preventDefault()
    #'blur .editable': 'saveContent'

  listen: ->

  show: (animation) ->
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      if @model.has('attendees')
        @renderSubviews()
      else
        @loadMore()
    Backbone.trigger 'engagements:router:update', @model.get('id')
    Backbone.trigger 'engagements:views:shown', 'detail'

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model.unset('selected')
      @remove()
    )
    Backbone.trigger('engagements:views:hidden', @)

  render: ->
    @$el.html(@template @model.tplAttrs())
    @

  loadMore: ->
    @model.fetch
      success: => @renderSubviews()

  renderSubviews: ->
    @subviews =
      attendance_card: new Phonebook.Views.Engagements.AttendanceCardView
        el: @$el.find('.engagement-attendance')
        model: @model
      #media_card: new Phonebook.Views.MediaCard
      #  el: @$el.find('.engagement-media')
    _.each @subviews, (view) -> view.render()

  showUploads: (e) ->
    Backbone.trigger 'engagements:uploading', @model
    e.gesture.srcEvent.preventDefault()

  showAttendance: (e) ->
    Backbone.trigger 'engagements:attendance', @model
    e.gesture.srcEvent.preventDefault()

  back: ->
    Backbone.trigger 'engagements:index'

  removeSubviews: ->
    _.each @subviews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super
