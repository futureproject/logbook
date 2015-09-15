class ds.EngagementsNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Engagement
    @views =
      form: new ds.EngagementsFormView
        model: @model

  template: JST['phonebook/templates/engagements/new']

  className: 'engagement new'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#engagement-form"

