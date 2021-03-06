window.ds ||= {}
$ ->
  # preserve scope params on links
  $(document).on('click', 'a', (e) ->
    if this.search.match(/scope/i) || this.getAttribute('data-unscoped')?
      return
    else if this.search.length == 0
      this.search = "?scope_id=#{ds.CONSTANTS.scope.id}&scope_type=#{ds.CONSTANTS.scope.type}"
      true
    else
      this.search += "&scope_id=#{ds.CONSTANTS.scope.id}&scope_type=#{ds.CONSTANTS.scope.type}"
      true
  ).on('click', '.filtres a', (e) ->
    search = this.search
    for sorter in Object.keys(ds.CONSTANTS.sort_params)
      search += "&#{sorter}=#{ds.CONSTANTS.sort_params[sorter]}"
    this.search = search
    true
  ).on('click', '.labels a', (e) ->
    search = this.search
    for filter in Object.keys(ds.CONSTANTS.filter_params)
      search += "&#{filter}=#{ds.CONSTANTS.filter_params[filter]}"
    this.search = search
    true
  )

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
    $(window).off('beforeunload.ds')
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

  # prompt if there are unsaved changes on a form
  $(document).one('change', 'textarea, select[multiple]', (event) ->
    $('form').on('submit', (e) ->
      $(window).off('beforeunload.ds')
      true
    )
    $(window).on('beforeunload.ds', (event) ->
      "The information you've entered on this page will vanish into the aether if you leave before saving."
    )
  )

  # change Engagement form class when kind changes
  $(document).on('change', '#engagement_kind', (event) ->
    $t = $(this)
    kind = $t.val().toLowerCase().replace(' ','-')
    $t.closest('form').attr('data-kind', kind)
  )

  # load AJAX graphs
  ds.graphs ||= []
  $('.graph').each ->
    graph = new ds.GraphView
      url: this.getAttribute('data-url')
      el: this
    ds.graphs.push graph
  if window.matchMedia?
    mq = window.matchMedia('print')
    mq.addListener ->
      $('body').toggleClass('print', mq.matches)
      graph.chart.reflow() for graph in ds.graphs


