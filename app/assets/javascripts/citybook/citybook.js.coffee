#= require jquery
#= require jquery_ujs
#= require s3_direct_upload
$ ->
  $('#filters select').on('change', (e) ->
    console.log this
  )
