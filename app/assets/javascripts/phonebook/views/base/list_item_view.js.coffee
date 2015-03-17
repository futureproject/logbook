Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.ListItemView extends Backbone.View
  events:
    'touchstart .list-item-controls': (e) ->
      e.stopPropagation()
      @startPos.t = e.timeStamp
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    #'touchend': 'ontouchend'

  ontouchstart: (e) ->
    Backbone.trigger 'list_item:touchstart', e
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
    if @diff.x < -40
      @open(e)
    else
      @resetStyle()
      distanceMoved = Math.sqrt(@diff.x * @diff.x + @diff.y * @diff.y)
      @trigger('tapped') if (distanceMoved == 0 && @diff.t < 300)


  open: (e) ->
    @$el.addClass('list-item-open')
    @listenToOnce Backbone, 'list_item:touchstart', @close

  close: (e) ->
    @$el.removeClass('list-item-open')

  delete: (e) ->
    @diff.t = e.timeStamp - @startPos.t
    return unless @diff.t < 300
    e.preventDefault()
    e.stopPropagation()
    @el.style['-webkit-transition-property'] = "-webkit-transform"
    @el.style['-webkit-transition-duration'] = '.5s'
    @el.style['-webkit-transform'] = 'translate3d(-200%,0,0)'
    @$el.addClass('deleting').one('webkitTransitionEnd', =>
      @model.destroy()
    )

  calculatePositions: (e) ->

    @currentPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t

  controlTap: (e) ->
    @diff.t = e.timeStamp - @startPos.t
    return unless @diff.t < 300
    e.stopPropagation()
    @trigger 'controlTap', e
