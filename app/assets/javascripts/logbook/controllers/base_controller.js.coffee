class ds.BaseController extends Backbone.View
  initialize: ->
    @url = @$el.find('a').attr('href')
    @namespace = @url.replace('/logbook','')
    @views = {}
    @actions()
    @listenTo Backbone, "controller:activated", @cleanup
    @listenTo Backbone, "routed", @routeListener
    @routeListener()

  events:
    "click": "onclick"

  onclick: (e) ->
    e.preventDefault()
    return if location.pathname == @url
    ds.router.navigate @url, {trigger: true}

  activate: ->
    @cleanup(null)
    Backbone.trigger 'controller:activated', @

  cleanup: (active_controller) ->
    return if active_controller == @
    _.each @views, (view) -> view.hide()
    @$el.removeClass("active")

  routeListener: ->
    @$el.toggleClass('active', !!location.pathname.match(@namespace))
