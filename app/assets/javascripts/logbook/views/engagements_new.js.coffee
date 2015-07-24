class ds.EngagementsNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Engagement
    @views =
      form: new ds.EngagementsFormView
        model: @model

  template: JST['logbook/templates/engagements_new']

  className: 'engagement edit'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#engagement-form"

