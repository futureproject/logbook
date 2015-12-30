window.tfp ||= {}

$ ->
  # turn on infinite scroll on the notes list
  $('.notes').each ->
    scroller = new Waypoint.Infinite
      element: this
      items: '.note'
      more: 'a[rel=next]'

  $(document).on('click', 'a', (event) ->
    # intercept link clicks
    event.preventDefault()
    target = this.href
    # if the link is to an image, show the image on main viewer
    if target.match(/jpeg|jpg|gif|png/i)
      $('.note-viewer').html("<div class='lb-loading'></div>")
      img = document.createElement('img')
      img.src = target
      $(img).one('load', ->
        $(document).trigger('galleryImage:loaded', img)
      ).each( ->
        $(this).load() if this.complete
      )
  ).on('galleryImage:loaded', (event, image) ->
    # show image on main viewer
    $('.note-viewer').html image
  )

