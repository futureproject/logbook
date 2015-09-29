class ds.EngagementsFormView extends Backbone.View
  initialize: ->
    @views = {}
    @listenTo @model, 'change', @render
    @listenTo ds.collections.schools, 'reset', @postRender

  tagName: 'form'
  className: -> @model.get('kind').toLowerCase()

  events:
    'submit': 'onsubmit'
    'change #kind': 'setCssClassFromKind'
    'change #duration-number': 'setDuration'
    'change #duration-units': 'setDuration'

  setCssClassFromKind: (event) ->
    @$el.attr('class', $(event.currentTarget).val().toLowerCase())

  template: JST['logbook/templates/engagements_form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @delegateEvents()
    @postRender()
    @

  postRender: ->
    @setSchoolOptions()
    Backbone.Syphon.deserialize @, @model.toJSON()
    @selectize "#attendee_ids",
      initialItems: @model.get 'attendees'
    @setDurationProxy()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    if @model.save data
      @reflectIdChange() if @model.isNew()
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

  setDurationProxy: ->
    valueField = @$el.find("#duration-number")
    unitField = @$el.find("#duration-units")
    duration = @model.get('duration')
    if duration < 1
      valueField.val(Math.round(duration*60))
      unitField.val("minutes")
    else
      valueField.val(duration)
      unitField.val("hours")

  setDuration: (event) ->
    valueField = @$el.find("#duration-number")
    unitField = @$el.find("#duration-units")
    durationField = @$el.find("#duration")
    if unitField.val() == "minutes"
      duration = parseFloat(valueField.val()/60).toFixed(3)
    else
      duration = valueField.val()
    @$el.find("#duration").val(duration)

  reflectIdChange: ->
    @model.once 'change:id', =>
      ds.router.navigate ds.urlsHelper.urlFor(@model), { trigger: true, replace: true }

  selectize: (selector, options) ->
    options ||= {}
    $field = $(selector)
    items = options.initialItems
    id = "#{$field.attr('id')}_#{_.size(@views)}"
    $frag = $(document.createDocumentFragment())
    _.each items, (item) ->
      $frag.append "<option selected value='#{item.id}'>#{item.first_name} #{item.last_name}</option>"
    $field.append $frag
    @views[id] = new ds.SelectizeView({ el: $field })
