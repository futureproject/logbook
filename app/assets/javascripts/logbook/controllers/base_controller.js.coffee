class ds.BaseController extends Backbone.View
  initialize: ->
    @url = @$el.find('a').attr('href')
    @namespace = @url.replace('/logbook','')
    @views = {}
    @actions()
    @listenTo Backbone, "routed", @routeListener
    @routeListener()

  events:
    "click": "onclick"

  onclick: (e) ->
    e.preventDefault()
    return if location.pathname == @url
    ds.router.navigate @url, {trigger: true}

  activate: ->
    _.each @views, (view) -> view.hide()

  cleanup: (active_controller) ->
    return if active_controller == @
    @$el.removeClass("active")

  routeListener: ->
    @$el.toggleClass('active', !!location.pathname.match(@namespace))

