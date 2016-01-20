class ds.MenuView extends Backbone.View
  className: "menu animation-fallin"
  template: JST["phonebook/templates/menu"]
  events:
    'click .close': 'hide'
    'scroll': 'block'
    'touchmove': 'block'
    'click .log-out': 'logout'

  tplAttrs: -> { user: ds.CURRENT_USER.toJSON() }

  render: ->
    @$el.html(@template(@tplAttrs()))
    @

  block: (event) -> event.preventDefault()

  logout: ->
    localStorage.clear()
    location.href = "/auth/logout"

