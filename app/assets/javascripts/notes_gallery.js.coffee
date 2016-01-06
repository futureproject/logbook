window.tfp ||= {}

$ ->
  # turn on infinite scroll on the notes list
  $('.notes-list').each ->
    console.log '!'
    scroller = new Waypoint.Infinite
      element: this
      items: '.note'
      more: 'a[rel=next]'

  $(document).on('click', 'a', (event) ->
    # intercept link clicks if the screen is large
    return unless window.matchMedia('(min-width: 768px)').matches
    target = this.href
    # if the link is to an image, show the image on main viewer
    if target.match(/jpeg|jpg|gif|png/i)
      event.preventDefault()
      $('.note-viewer').html("<div class='lb-loading'></div>")
      img = document.createElement('img')
      img.src = target
      $(img).one('load', ->
        $(document).trigger('gallery:loaded', img)
      ).each( ->
        $(this).load() if this.complete
      )
    else if target.match(/mpg|mov|mpeg|mp4|m4v/i)
      event.preventDefault()
      $('.note-viewer').html("<div class='lb-loading'></div>")
      vid = document.createElement('video')
      vid.controls = "controls"
      vid.autoplay = "autoplay"
      vid.src = target
      $(document).trigger('gallery:loaded', vid)
    else if target.match(/mp3|m4a|amr/i)
      event.preventDefault()
      $('.note-viewer').html("<div class='lb-loading'></div>")
      vid = document.createElement('audio')
      vid.controls = "controls"
      vid.autoplay = "autoplay"
      vid.src = target
      $(document).trigger('gallery:loaded', vid)
  ).on('gallery:loaded', (event, media) ->
    # show media on main viewer
    $('.note-viewer').html media
  ).on('click', '.notes video', (event) ->
    # intercept video clicks and play them in the gallery
    if this.paused then tfp.playMedia(this) else tfp.pauseMedia(this)
  )

