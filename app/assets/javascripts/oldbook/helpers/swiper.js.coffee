ds.swiper =
  ontouchstart: (e) ->
    @isScrolling = null
    @startPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp
    @currentPos = @startPos
    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t

  ontouchmove: (e) ->
    return unless @startPos
    @currentPos =
      x: e.originalEvent.touches?[0].screenX || e.screenX
      y: e.originalEvent.touches?[0].screenY || e.screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t

    @isScrolling = !!(@isScrolling || Math.abs(@diff.y) > Math.abs(@diff.x))

    return if @isScrolling

    @$el.css({transform: "translate3d(#{@diff.x}px, 0, 0)"})

  ontouchend: (e) ->
    return if @isScrolling || !@startPos?
    @diff.t = e.timeStamp - @startPos.t

    if @model.has('operating')# if the fucking thing is open
      # CLOSE IT
        @el.style['-webkit-transform'] = 'translate3d(0,0,0)'
        @model.unset('operating')
    else if Math.abs(@diff.x) > 40# otherwise, if the thing has moved more than 40px left
      # OPEN IT
      @model.set('operating', true)
      @el.style['-webkit-transform'] = 'translate3d(-50%,0,0)'
    else if @diff.t < 300 #select the thing!
      e.preventDefault()
      @$el.css({transform: "translate3d(0, 0, 0)"})
      @model.set('selected', true)
    else
      @el.removeAttribute 'style'

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

