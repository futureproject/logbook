class ds.MenuView extends Backbone.View
  className: "menu"
  template: JST["phonebook/templates/menu"]
  events:
    'click .close': 'hide'
    'scroll': 'block'
    'touchmove': 'block'
    'click .log-out': 'logout'

  tplAttrs: ->
    {
      user: ds.user.current().toJSON()
    }
  render: ->
    @$el.html(@template(@tplAttrs()))
    @animateIn()
    @

  block: (event) -> event.preventDefault()

  hide: ->
    @$el.animate
      left: "#{-window.innerWidth}px"
      opacity: 0
    , 'fast', => @remove()

  animateIn: ->
    @$el.css
      left: "#{-window.innerWidth}px"
      opacity: 0
    @$el.animate
      left: 0
      opacity: 1
    , 'fast'

  logout: ->
    localStorage.clear()
    $("body > div").fadeOut ->
      window.location.reload()

