ds.animationHelper =
  endEvent: ->
    if @end
      @end
    else
      @setEnd()

  setEnd: ->
    console.log 'setting end!'
    el = document.createElement("div")
    animations = {
      "animation"      : "animationend",
      "OAnimation"     : "oAnimationEnd",
      "MozAnimation"   : "animationend",
      "WebkitAnimation": "webkitAnimationEnd"
    }
    evt = null
    for key, val of animations
      if (typeof el.style[key]) == "string"
        evt = animations[key]
    @end = evt
    @end


