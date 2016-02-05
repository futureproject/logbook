class ds.EngagementFormView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @views =
      person_selector: new ds.PersonSelectorView
        field_name: "attendee_ids"
        field_label: "Attendees"

  tagName: 'form'
  className: 'panel'

  events:
    'submit': 'onsubmit'
    'change #kind': 'setCssClassFromKind'
    'change #photo': 'uploadPhoto'
    'focus #duration': (event) -> $(event.currentTarget).val('')

  listen: ->
    @listenTo @model, 'change', @render

  #setCssClassFromKind: (event) ->
    #@$el.attr('class', $(event.currentTarget).val().toLowerCase())

  template: JST['phonebook/templates/engagements/form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    attrs = @model.toJSON()
    # render duration as minutes
    attrs.duration = attrs.duration * 60
    Backbone.Syphon.deserialize @, attrs
    @views.person_selector.renderTo "#person-selector", { replace: true }
    attendees = @views.person_selector.collection.getMultiple @model.get('attendee_ids')
    @views.person_selector.selection.add attendees
    @delegateEvents()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    # convert minutes back to hours
    duration = parseFloat(data.duration/60).toFixed(3)
    data.duration = duration
    if @model.save data
      Backbone.trigger "session_storage:engagements:save", @model
      Backbone.trigger "notification", "Engagement Added!"
      if @success_fn
        @success_fn()
      else
        Backbone.trigger "engagements:action", "show", @model.id
    else
      alert @model.validationError

  uploadPhoto: (event) ->
    event.stopPropagation()
    file = event.currentTarget.files[0]
    u = new ds.UploaderView
      model: @model
      file: file

