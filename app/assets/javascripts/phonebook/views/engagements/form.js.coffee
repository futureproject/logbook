class ds.EngagementFormView extends Backbone.View
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    throw "EngagementsFormView needs a people_collection to take attendance" unless @people_collection
    @views = {}
    @listenTo @model, 'change', @render

  tagName: 'form'
  className: -> "panel " + @model.get('kind').toLowerCase()

  events:
    'submit': 'onsubmit'
    #'change #kind': 'setCssClassFromKind'
    'change #photo': 'uploadPhoto'

  #setCssClassFromKind: (event) ->
    #@$el.attr('class', $(event.currentTarget).val().toLowerCase())

  template: JST['phonebook/templates/engagements/form']

  render: ->
    @$el.html @template(@model.tplAttrs())
    @delegateEvents()
    @postRender()
    @

  postRender: ->
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
      #Backbone.trigger "session_storage:engagements:save", @model
      Backbone.trigger "engagements:action", "show", @model.id
      Backbone.trigger "notification", "Engagement Added!"
    else
      alert @model.validationError

  uploadPhoto: (event) ->
    event.stopPropagation()
    file = event.currentTarget.files[0]
    u = new ds.UploaderView
      model: @model
      file: file

