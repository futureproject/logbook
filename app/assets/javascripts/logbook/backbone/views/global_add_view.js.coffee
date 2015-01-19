window.ds ||= {}

class ds.GlobalAddView extends Backbone.View
  events:
    'ajax:success': 'success'
    'ajax:error': 'error'

  render: (template) ->
    v = document.querySelector '.vex'
    if v?
      @setElement(v)
      @$el.find('.vex-content').html(template)
    else
      vex.open
        content: template
        overlayClosesOnClick: false
        escapeButtonCloses: false
        showcloseButton: false
      @setElement('.vex')
    @$el.find('form').attr('data-remote', true).find('select[multiple]').each ->
      new ds.SelectizeView({ el: this })
    @$el.find('input[type=text]').first().focus()
    @

  success: (event, data, status) ->
    vex.closeAll()
    if document.querySelector('.table')
      $('html, body').animate
        scrollTop: 0
    new ds.FlashView({ message: "Saved!" })

  error: (event, response, status) ->
    errors = JSON.parse(response.responseText)
    errorName = Object.keys(errors)[0]
    message = errors[errorName][0]
    alert "#{errorName} #{message}"


$ ->
  ds.global_add_view = new ds.GlobalAddView
