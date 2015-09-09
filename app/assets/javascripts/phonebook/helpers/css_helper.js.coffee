ds.cssHelper =
  init: ->
    if navigator.standalone
      document.quertSelector('body').classList.add("standalone")
    if (window.devicePixelRatio && devicePixelRatio >= 2)
      testElem = document.createElement('div')
      testElem.style.border = '.5px solid transparent'
      document.body.appendChild(testElem)
      if (testElem.offsetHeight == 1)
        document.querySelector('html').classList.add('hairlines')
      document.body.removeChild(testElem)
