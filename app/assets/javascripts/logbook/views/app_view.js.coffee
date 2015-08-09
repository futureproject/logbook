class ds.AppView extends Backbone.View
  el: 'body'
  initialize: ->
    # add session credentials to each ajax request
    $.ajaxPrefilter (options, originalOptions, jqXHR) ->
      jqXHR.withCredentials = true
      console.log "AJAX call to #{options.url}"
      true

    # update the body class when the route changes
    @listenTo Backbone, 'routed', @routeChangeHandler

  events:
    'click #yield a': 'internalLinkHandler'

  internalLinkHandler: (e) ->
    path = e.currentTarget.getAttribute('href')
    return true if !path? || path.match(/http/i) || path == "#"
    if (!(e.which > 1 || e.shiftKey || e.altKey || e.metaKey || e.ctrlKey))
      e.preventDefault()
      ds.router.navigate path, { trigger: true }

  routeChangeHandler: (route) ->
    return if !!route.match(/notes/i)
    css_class = route.replace(/\_/g, ' ')
    @el.setAttribute 'class', css_class

