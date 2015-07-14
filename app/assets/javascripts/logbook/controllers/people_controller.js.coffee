class ds.PeopleController extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'people:show', @show
    @listenTo Backbone, 'controller:active', @cleanup

  events:
    'click': 'show'

  cleanup: (controller) ->
    if controller == @
      @$el.addClass('active')
      @active = true
    else
      @$el.removeClass('active')
      @view?.hide()
      @active = false

  show: (event) ->
    event?.preventDefault()
    return if @active
    Backbone.trigger 'controller:active', @
    $("#yield").html @template()

  el: '#people-nav-item'

  template: _.template("<div class='titlebar'><div class='title'>People</div></div>")
