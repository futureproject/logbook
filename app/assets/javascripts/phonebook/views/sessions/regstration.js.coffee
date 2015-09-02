class ds.SessionsRegistrationView extends Backbone.View
  template: JST["phonebook/templates/sessions/registration"]
  className: "panel"
  events:
    'change #site_id': 'loadSchoolOptions'
    'submit': 'processRegistration'
    'reset': 'onReset'

  initialize: ->
    @views =
      spinner: new ds.SpinnerView

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @loadSiteOptions()
    Backbone.Syphon.deserialize @, @model.toJSON()

  loadSiteOptions: ->
    $.getJSON ds.apiHelper.urlFor('sites'), (response) =>
      fragment = document.createDocumentFragment()
      $f = $(fragment)
      $f.append "<option value></option>"
      _.each response, (s) ->
        $f.append "<option value='#{s.id}'>#{s.name}</option>"
      @$el.find('#site_id').html $f

  loadSchoolOptions: (event) ->
    site_id = $(event.currentTarget).val()
    $.getJSON "#{ds.apiHelper.urlFor('schools')}?scope_type=Site&scope_id=#{site_id}", (response) =>
      fragment = document.createDocumentFragment()
      $f = $(fragment)
      $f.append "<option value></option>"
      _.each response, (s) ->
        $f.append "<option value='#{s.id}'>#{s.name}</option>"
      @$el.find('#school_id').html $f

  processRegistration: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    valid = (!!data.first_name && !!data.last_name && !!data.site_id)
    if valid
      person = new ds.Person(data)
      person.save data,
        success: (res) ->
          msg = "All set, #{person.get('first_name')}. Tap a person's name to log an engagement with them."
          Backbone.trigger "notify", msg
          ds.user.create person.toJSON()
          ds.run()
        error: (error) ->
          console.log error
    else
      alert("Actually, all fields except school are required.")

  onReset: (event) ->
    event.preventDefault()
    Backbone.trigger "sessions:do", "new"

