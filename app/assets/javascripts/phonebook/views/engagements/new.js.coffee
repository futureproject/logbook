class ds.EngagementNewView extends Backbone.View
  className: 'screen animation-fallin engagements new-engagement'
  template: JST["phonebook/templates/engagements/new"]
  initialize: (options={}) ->
    @[option] = options[option] for option of options
    @model ||= new ds.Engagement
    @views =
      form: new ds.EngagementFormView
        model: @model
        success_fn: @success_fn
    @listen()

  template: JST['phonebook/templates/engagements/new']

  events:
    'touchstart .button': (e) ->
    'click .cancel': 'cancel'
    'click .done': (e) -> @$el.find('form').submit()

  listen: ->

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#engagement-form"

  cancel: ->
    if @cancel_fn
      @cancel_fn()
    else
      Backbone.trigger "engagements:action", "index"

