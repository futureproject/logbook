Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.TableItemView extends Backbone.View
  events:
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    'touchend': 'ontouchend'

  ontouchstart: (e) ->
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

  ontouchend: (e) ->
    return if @isScrolling || !@startPos?
    @diff.t = e.timeStamp - @startPos.t
    distanceMoved = Math.sqrt(@diff.x * @diff.x + @diff.y * @diff.y)
    @trigger('tapped') if (distanceMoved == 0 && @diff.t < 300)


  calculatePositions: (e) ->

    @currentPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t
