class ds.PeopleFormView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render

  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/people_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.set data
    @model.save()
    ds.collections.people.add @model, { merge: true }
    ds.router.navigate ds.urlsHelper.urlFor(@model), {trigger: true}
