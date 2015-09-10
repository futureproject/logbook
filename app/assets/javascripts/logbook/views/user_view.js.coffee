class ds.UserView extends Backbone.View
  initialize: ->
    @model = ds.current_user
    @visible = true
    @listenTo Backbone, 'scopes:toggle', @toggle
    @render()

  el: '#user'

  events:
    'click .to-profile': 'to_profile'

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
    @$el.html @template(@model.tplAttrs())
    @

  to_profile: (event) ->
    event.preventDefault()
    path = event.currentTarget.pathname
    console.log path
    ds.router.navigate path, { trigger: true }

