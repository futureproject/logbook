class ds.PeopleEditView extends Backbone.View
  initialize: ->
    @views =
      form: new ds.PeopleFormView
        model: @model

  template: JST['logbook/templates/people_edit']

  className: 'person edit'

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#person-form"

