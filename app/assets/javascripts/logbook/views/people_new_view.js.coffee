class ds.PeopleNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Person
    @views =
      form: new ds.PeopleFormView
        model: @model

  template: JST['logbook/templates/people_new']

  className: 'person edit'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#person-form"

