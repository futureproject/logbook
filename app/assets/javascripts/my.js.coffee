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
      console.log res
      $('.assets').prepend("
        <div class='asset'>
          <a href='#{res.external_url}' target='_blank'>
            <img src='#{res.external_url}' alt='#{res.caption}' />
          </a>
        </div>
      ")
    )
