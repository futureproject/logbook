ds.cssHelper =
  init: ->
    # add border to body when running as a home screen app
    if navigator.standalone
      document.body.classList.add("standalone")

    # add ios class, for form styling
    if (navigator.platform.match(/iphone|ipad|ipod/i))
      document.body.classList.add('ios')

    # add half-pixel borders if supported
    if (window.devicePixelRatio && devicePixelRatio >= 2)
      testElem = document.createElement('div')
      testElem.style.border = '.5px solid transparent'
      document.body.appendChild(testElem)
      if (testElem.offsetHeight == 1)
        document.querySelector('html').classList.add('hairlines')
      document.body.removeChild(testElem)

    # pick an animationEnd event for this browser
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
    ds.ANIMATION_END_EVENT = evt

