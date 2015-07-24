class ds.ProjectsFormView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/projects_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @setSchoolOptions()
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.set data
    @reflectIdChange() if @model.isNew
    @model.save()
    ds.collections.projects.add @model, { merge: true }
    ds.router.navigate ds.urlsHelper.urlFor(@model), {trigger: true}

  setSchoolOptions: ->
    fragment = document.createDocumentFragment()
    $f = $(fragment)
    $f.append "<option value></option>"
    ds.collections.schools.each (s) ->
      $f.append "<option value='#{s.get('id')}'>#{s.get('name')}</option>"
    @$el.find('#person_school_id').html $f

  reflectIdChange: ->
    @model.once 'change:id', =>
      ds.router.navigate ds.urlsHelper.urlFor(@model), { trigger: true, replace: true }
