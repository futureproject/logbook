window.tfp ||= {}
$ ->
  $('.s3-uploader').each ->
    $t = $(this)
    $t.S3Uploader(
      additional_data:
        asset:
          attachable_id: this.getAttribute('data-attachable-id')
          attachable_type: this.getAttribute('data-attachable-type')
    )
    $t.on('ajax:complete', (e, data) ->
      res = JSON.parse data.responseText
      img = if res.external_url.match(/jpg|png|gif/i)? then res.external_url else '//dream-os-production.s3.amazonaws.com/static-assets/document.png'
      $('.assets').prepend("
        <div class='asset deletable'>
          <a href='#{res.external_url}' target='_blank' >
            <img src='#{img}' alt='#{res.caption}' />
          </a>
          <div class='asset-actions'>
            <div class='asset-caption'>#{res.caption}</div>
            <a href='/api/v1/assets/#{res.id}' data-remote data-method='delete' data-confirm='Are you sure?'>Delete</a>
          </div>
        </div>
      ")
    )

  $(document).on('ajax:success', (e) ->
    t = e.target
    if t.nodeName == "A" && t.getAttribute('data-method') == "delete"
      $(t).closest('.deletable').fadeOut () -> $(this).remove()
  )
