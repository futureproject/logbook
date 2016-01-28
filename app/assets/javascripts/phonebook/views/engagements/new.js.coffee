class ds.EngagementNewView extends Backbone.View
  className: 'screen animation-fallin new-engagement'
  template: JST["phonebook/templates/engagements/new"]
  initialize: (options={}) ->
    @[option] = options[option] for option of options
    @model ||= new ds.Engagement
    @views =
      form: new ds.EngagementFormView
        model: @model
    @listen()

  template: JST['phonebook/templates/engagements/new']

  className: 'engagement new'

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
    Backbone.trigger "people:action", "show", @person.id

