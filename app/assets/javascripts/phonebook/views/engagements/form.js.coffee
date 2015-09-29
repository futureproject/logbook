class ds.EngagementsFormView extends Backbone.View
  initialize: ->
    @views = {}
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

  tagName: 'form'
  className: -> "panel " + @model.get('kind').toLowerCase()

  events:
    'submit': 'onsubmit'
    'change #kind': 'setCssClassFromKind'

  setCssClassFromKind: (event) ->
    @$el.attr('class', $(event.currentTarget).val().toLowerCase())

  template: JST['phonebook/templates/engagements/form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @delegateEvents()
    @postRender()
    @

  postRender: ->
    @setSchoolOptions()
    attrs = @model.toJSON()
    # render duration as minutes
    attrs.duration = attrs.duration * 60
    Backbone.Syphon.deserialize @, attrs

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    # convert minutes back to hours
    duration = parseFloat(data.duration/60).toFixed(3)
    data.duration = duration
    if @model.save data
      ds.collections.engagements.add @model, { merge: true }
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

