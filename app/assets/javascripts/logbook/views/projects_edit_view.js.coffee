class ds.ProjectsEditView extends Backbone.View
  initialize: ->
    @views =
      form: new ds.ProjectsFormView
        model: @model

  template: JST['logbook/templates/projects_edit']

  className: 'project edit'

  events:
    'click .destroy': 'destroy'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#project-form"

  destroy: (event) ->
    if (confirm('Permanently delete this project?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

