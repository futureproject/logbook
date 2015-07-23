class ds.PeopleEditView extends Backbone.View
  initialize: ->
    @views =
      form: new ds.PeopleFormView
        model: @model

  template: JST['logbook/templates/people_edit']

  className: 'person edit'

  events:
    'click .destroy': 'destroy'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#person-form"

  destroy: (event) ->
    if (confirm('Are you sure?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

