window.ds ||= {}
$ ->
  ds.selects = {}
  $('select[multiple]').each ->
    ds.selects[this.id] = $(this).selectize()
