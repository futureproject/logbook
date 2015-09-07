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

    @listenTo Backbone, 'scroll:reset', @resetScrollPosition

  resetScrollPosition: (pos) ->
    pos ||= 0
    @$el.scrollTop(pos)
