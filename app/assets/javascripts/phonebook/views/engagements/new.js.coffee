class ds.EngagementNewView extends Backbone.View
  className: 'screen animation-fallin new-engagement'
  template: JST["phonebook/templates/engagements/new"]
  initialize: (options={}) ->
    @[option] = options[option] for option of options
    @model ||= new ds.Engagement
    throw "EngagementsNewView Needs a people_collection to take attendance" unless @people_collection
    @views =
      form: new ds.EngagementFormView
        model: @model
        people_collection: @people_collection
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

