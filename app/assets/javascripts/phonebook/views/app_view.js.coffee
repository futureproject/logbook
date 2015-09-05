class ds.AppView extends Backbone.View
  el: '#phonebook'
  template: _.template '<div id="phonebook-people"></div>'
  render: ->
    @$el.html @template()

  initialize: ->
    # add session credentials to each ajax request
    $(document).on 'ajaxSend', (event, xhr, options) ->
      user = ds.user.current()
      return unless user
      xhr.setRequestHeader "X-DS-USER", user.get('email')
      #xhr.setRequestHeader "X-DS-SCOPE-TYPE", user.get('scope_type')
      #xhr.setRequestHeader "X-DS-SCOPE-ID", user.get('scope_id')

    # update the body class when the route changes
    #@listenTo Backbone, 'routed', @routeChangeHandler

  #events:
    #'click #yield a': 'internalLinkHandler'

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

