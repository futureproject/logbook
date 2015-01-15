Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.ListItemView extends Backbone.View
  events:
    'touchstart .list-item-controls': (e) ->
      e.stopPropagation()
      @startPos.t = e.timeStamp
    'touchend .delete': 'delete'
    'touchend .list-item-controls': 'controlTap'
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    'touchend': 'ontouchend'
    #'touchcancel': 'resetStyle'
    #'mouseup': 'ontouchend'
    #'mousedown': 'ontouchend'
    #'mousemove': 'ontouchend'

  ontouchstart: (e) ->
    Backbone.trigger 'list_item:tapped', e
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

    @$el.css({transform: "translate3d(#{@diff.x}px, 0, 0)"}) if @diff.x <= 0

  ontouchend: (e) ->
    return if @isScrolling || !@startPos?
    @diff.t = e.timeStamp - @startPos.t
    if @diff.x < -40
      @open(e)
    else
      @resetStyle()

  open: (e) ->
    @model.set('operating', true)
    @el.style['-webkit-transform'] = 'translate3d(-200px,0,0)'
    @listenToOnce Backbone, 'list_item:tapped', @close

  close: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.unset 'operating'
    @resetStyle()

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

  resetStyle: ->
    return unless @el.getAttribute('style')?
    @el.removeAttribute 'style'

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
