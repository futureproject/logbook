class ds.MenuView extends Backbone.View
  className: "menu animation-fallin"
  template: JST["phonebook/templates/menu"]
  events:
    'click .close': 'hide'
    'click .engagements': -> location.href = "/phonebook/engagements/new"
    'click .people': -> location.href = "/phonebook/people"
    'scroll': 'block'
    'touchmove': 'block'
    'click .log-out': 'logout'

  tplAttrs: -> { user: ds.CURRENT_USER.toJSON() }

  render: ->
    @$el.html(@template(@tplAttrs()))
    @

  block: (event) -> event.preventDefault()

  logout: -> Backbone.trigger "app:logout"

