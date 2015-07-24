class ds.BaseController extends Backbone.View
  initialize: ->
    @views = {}
    @actions()
    @listenTo Backbone, "controller:activated", @cleanup

  events:
    "click": "onclick"

  onclick: (e) ->
    e.preventDefault()
    url = @$el.find('a').attr('href')
    return if location.pathname == url
    ds.router.navigate url, {trigger: true}

  activate: ->
    _.each @views, (view) -> view.hide()
    @$el.addClass("active")
    @active = true
    Backbone.trigger "controller:activated", @

  cleanup: (active_controller) ->
    return if active_controller == @
    @$el.removeClass("active")
    @active = false

