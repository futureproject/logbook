window.ds ||= {}
$ ->
  # activate selectize on select[multiples]
  ds.selects = {}
  $('select[multiple]').each ->
    ds.selects[this.id] = $(this).selectize()

  # active direct-to-s3 upload forms
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
      img = '//dream-os-production.s3.amazonaws.com/static-assets/document.png'
      $('.assets').prepend("
        <a href='#{res.external_url}' target='_blank' >
          <img src='#{img}' alt='#{res.caption}' />
        </a>
      ")
    )

