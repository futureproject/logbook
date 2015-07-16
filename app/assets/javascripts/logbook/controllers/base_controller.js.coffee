class ds.BaseController extends Backbone.View
  initialize: ->
    @views = {}
    @actions()
    @listenTo Backbone, "controller:activated", @cleanup

  events:
    "click": "onclick"

  onclick: (e) ->
    e.preventDefault()
    return if location.pathname == @rootURL
    ds.router.navigate(@rootURL, {trigger: true})

  activate: ->
    #return if @active
    @$el.addClass("active")
    @active = true
    Backbone.trigger "controller:activated", @

  cleanup: (active_controller) ->
    return if active_controller == @
    @$el.removeClass("active")
    @active = false
    _.each @views, (view) -> view.hide()

