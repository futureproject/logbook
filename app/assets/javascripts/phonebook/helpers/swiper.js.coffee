ds.swiper =
  ontouchstart: (e) ->
    @$el.removeClass('transitions')
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

    @$el.css({transform: "translate3d(#{@diff.x}px, 0, 0)"})

  ontouchend: (e) ->
    return if @isScrolling
    if @model.has('operating')# if the fucking thing is open
      # CLOSE IT
      @$el.addClass('transitions').css({transform: "translate3d(0, 0, 0)"})
        .one('webkitTransitionEnd', => @model.unset('operating'))
    else if Math.abs(@diff.x) > 70# otherwise, if the thing has moved more than 70px
      # OPEN IT
      @model.set('operating', true)
      @$el.addClass('transitions').css({transform: "translate3d(-50%, 0, 0)"})
    else
      # PUT THE FUCKING THING BACK
      @$el.addClass('transitions').css({transform: "translate3d(0, 0, 0)"})

