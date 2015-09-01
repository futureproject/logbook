class ds.SessionView extends Backbone.View
  className: "panel"
  initialize: ->
    @views =
      spinner: new ds.SpinnerView
    @model = new ds.User
    @step = 1
    @listenTo Backbone, 'sessions:new', @show

  events:
    'submit': 'processForm'
  template: JST["phonebook/templates/sessions_new"]

  render: ->
    @$el.html @template()
    @

  show: ->
    @renderTo "#phonebook"

  processForm: (event) ->
    event.preventDefault()

    email_filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    data = Backbone.Syphon.serialize @
    if !email_filter.test(data.email)
      @$el.find("header").html("<strong>Please enter a valid email address.</strong>")
    else
      $('input').attr('disabled','disabled')
      @$el.append @views.spinner.el
      $.ajax
        method: "GET"
        data: data
        url: ds.apiHelper.urlFor('sessions')
        success: (response) =>
          # this user already exists, so sign her in
          ds.user.create response
          ds.run()
        error: (response) =>
          # if this is a 404 error, move to registration step
          if response.status == 404
            Backbone.trigger "sessions:register", data.email
          # if it's another error, alert the message
          else
            alert "Error #{response.status}: #{response.statusText}"
        complete: =>
          $('input').removeAttr('disabled')
          @views.spinner.remove()

  showRegistration: ->
    @step = 2
    @render()


