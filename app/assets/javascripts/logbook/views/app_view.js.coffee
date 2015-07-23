class ds.AppView extends Backbone.View
  el: 'body'
  initialize: ->
    console.log 'app view go!'
    # add session credentials to each ajax request
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      jqXHR.withCredentials = true
      console.log "AJAX call to #{options.url}"
      true

  events:
    'click #yield a': 'internalLinkHandler'

  internalLinkHandler: (e) ->
    path = e.currentTarget.getAttribute('href')
    return true if path.match(/http/i)
    e.preventDefault()
    if (!(e.which > 1 || e.shiftKey || e.altKey || e.metaKey || e.ctrlKey))
      e.preventDefault()
      ds.router.navigate path, { trigger: true }

