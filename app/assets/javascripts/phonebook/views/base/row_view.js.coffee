Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.RowView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'row:opened', @beforeOpen
    @listenTo Backbone, 'row:closed', @afterClose
    @canTap = true

  events:
    'touchstart .row-controls': (e) ->
      e.stopPropagation()
      @startPos.t = e.timeStamp
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    'touchend': 'ontouchend'

  ontouchstart: (e) ->
    Backbone.trigger 'row:touchstart', e
    @isScrolling = null
    @startPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp
    @calculatePositions(e)

  ontouchmove: (e) ->
    return unless @startPos
    @calculatePositions(e)

    @isScrolling = !!(@isScrolling || Math.abs(@diff.y) > Math.abs(@diff.x))

    return if @isScrolling
    e.preventDefault()
    if @diff.x < -60
      @open(e)

  ontouchend: (e) ->
    return if @isScrolling || !@startPos?
    @diff.t = e.timeStamp - @startPos.t
    distanceMoved = Math.sqrt(@diff.x * @diff.x + @diff.y * @diff.y)
    @trigger('tapped') if (distanceMoved == 0 && @diff.t < 300 && @canTap)

  beforeOpen: (view) ->
    @canTap = false

  open: (e) ->
    return unless @canTap
    Backbone.trigger 'row:opened', @
    @$el.addClass('row-open')
    @listenToOnce Backbone, 'row:touchstart', @close

  close: (e) ->
    @$el.removeClass('row-open').one('webkitTransitionEnd', =>
      Backbone.trigger 'row:closed', @
    )

  afterClose: (view) ->
    @canTap = true

  calculatePositions: (e) ->

    @currentPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t
