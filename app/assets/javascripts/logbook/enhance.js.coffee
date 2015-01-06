window.ds ||= {}
$ ->
  # activate direct-to-s3 upload forms
  $('.s3-uploader').each ->
    $t = $(this)
    $t.S3Uploader(
      additional_data:
        asset:
          attachable_id: this.getAttribute('data-attachable-id')
          attachable_type: this.getAttribute('data-attachable-type')
    )
    $t.on('ajax:complete', (e, data) ->
      assetAttrs = JSON.parse data.responseText
      if !!assetAttrs.external_url.match(/jpg|gif|png/i)
        assetAttrs.thumbnail = assetAttrs.external_url
      else
        assetAttrs.thumbnail = "//dream-os-production.s3.amazonaws.com/static-assets/document.png"
      $('.assets').prepend("
        <div class='asset' id='asset_#{assetAttrs.id}'>
          <div class='asset'>
            <a href='#{assetAttrs.external_url}' target='_blank' >
              <img src='#{assetAttrs.thumbnail}' alt='#{assetAttrs.caption}' />
            </a>
          </div>
          <div class='asset-links'>
            <a href='/logbook/assets/#{assetAttrs.id}' data-confirm='Are you sure?' data-remote='true' data-method='delete'>
              Destroy
            </a>
        </div>
      ")
    )

  # turn on the global add menu
  vex.defaultOptions.className = 'vex-theme-wireframe'
  $(document).on('vexOpen', (e) =>
    $('#global-add').addClass('open')
  ).on('vexClose', (event) ->
    $('#global-add').removeClass('open')
  )
  $('#global-add').on('click', (event) ->
    if this.classList.contains 'open'
      event.preventDefault()
      event.stopPropagation()
      this.classList.remove 'open'
      vex.closeAll()
  )

#fade the flash notices
  $('.flash').each ->
    $t = $(this)
    setTimeout ->
      $t.slideUp('fast')
    , 2000

