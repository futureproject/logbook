ds.swiper =
  ontouchstart: (e) ->
    @isScrolling = null
    @startPos =
      x: e.originalEvent.touches[0].screenX
      y: e.originalEvent.touches[0].screenY
      t: e.timeStamp
    @currentPos = @startPos
    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t

  ontouchmove: (e) ->
    @currentPos =
      x: e.originalEvent.touches[0].screenX
      y: e.originalEvent.touches[0].screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t

    @isScrolling = !!(@isScrolling || Math.abs(@diff.y) > Math.abs(@diff.x))

    return if @isScrolling || @diff.x > 0

    @$el.removeClass('transitions').css({transform: "translate3d(#{@diff.x}px, 0, 0)"})

  ontouchend: (e) ->
    console.log @diff.x
    return if @isScrolling || @diff.x > 0
    if Math.abs(@diff.x) > 70 && !@model.has('operating')
      @model.set('operating', true)
      @$el.addClass('transitions').css({transform: "translate3d(-50%, 0, 0)"})
    else if @model.has('operating')
      @$el.addClass('transitions').css({transform: "translate3d(0, 0, 0)"})
    else
      @model.unset('operating')
      @$el.addClass('transitions').css({transform: "translate3d(0, 0, 0)"})

