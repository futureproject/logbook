class ds.UserView extends Backbone.View
  initialize: ->
    @model = ds.current_user
    @visible = true
    @listenTo Backbone, 'scopes:toggle', @toggle
    @render()

  el: '#user'

  toggle: ->
    if @visible then @hide() else @show()

  hide: ->
    @$el.addClass('hidden')
    @visible = false

  show: ->
    @visible = true
    @$el.removeClass('hidden')

  template: JST['logbook/templates/user']

  render: ->
    @$el.html @template(@model.toJSON())
    @

