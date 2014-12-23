window.ds ||= {}
$ ->
  # activate selectize on select[multiples]
  ds.selects = {}
  $('select[multiple]').each ->
    ds.selects[this.id] = $(this).selectize()

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
        <a href='#{assetAttrs.external_url}' target='_blank' >
          <img src='#{assetAttrs.thumbnail}' alt='#{assetAttrs.caption}' />
        </a>
      ")
    )

  ds.hound = new Bloodhound
    local: []
    remote:
      url: '/api/v1/people?q=%QUERY'
      filter: (ppl) ->
        lst = $.map ppl, (person) -> { name: person.name }
        console.log lst
        lst
    datumTokenizer: Bloodhound.tokenizers.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace

  ds.hound.initialize()

  $('#search input').typeahead({hint: true, minLength: 1, highlight: true},
    name: 'people'
    displayKey: 'name'
    source: ds.hound.ttAdapter()
  )
