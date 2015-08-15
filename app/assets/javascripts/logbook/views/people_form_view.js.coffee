class ds.PeopleFormView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

  tagName: 'form'
  events:
    'submit': 'onsubmit'

  template: JST['logbook/templates/people_form']

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
    if @model.save data
      @reflectIdChange() if @model.isNew()
      ds.collections.people.add @model, { merge: true }
      ds.router.navigate ds.urlsHelper.urlFor(@model), {trigger: true}
    else
      alert @model.validationError

  setSchoolOptions: ->
    fragment = document.createDocumentFragment()
    $f = $(fragment)
    $f.append "<option value></option>"
    ds.collections.schools.each (s) ->
      $f.append "<option value='#{s.get('id')}'>#{s.get('name')}</option>"
    @$el.find('#school_id').html $f

  reflectIdChange: ->
    @model.once 'change:id', =>
      ds.router.navigate ds.urlsHelper.urlFor(@model), { trigger: true, replace: true }
