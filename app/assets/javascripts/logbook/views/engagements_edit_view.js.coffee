class ds.EngagementsEditView extends Backbone.View
  initialize: ->
    @views =
      form: new ds.EngagementsFormView
        model: @model

  template: JST['logbook/templates/engagements_edit']

  className: 'engagement edit'

  events:
    'click .destroy': 'destroy'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#engagement-form"

  destroy: (event) ->
    if (confirm('Are you sure?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

