class ds.ProjectsNewView extends Backbone.View
  initialize: ->
    @model ||= new ds.Project
    @views =
      form: new ds.ProjectsFormView
        model: @model

  template: JST['logbook/templates/projects_new']

  className: 'project edit'

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.form.renderTo "#project-form"

