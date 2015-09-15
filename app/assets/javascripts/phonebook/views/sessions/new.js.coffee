class ds.SessionsNewView extends Backbone.View
  template: JST["phonebook/templates/sessions/new"]
  className: "panel screen"
  initialize: ->
    @views =
      spinner: new ds.SpinnerView
    @model = new ds.User

  events:
    'submit': 'processForm'

  render: ->
    @$el.html @template()
    @

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
          msg = "Welcome, #{response.first_name}. Your people are downloading."
          Backbone.trigger 'notification', msg
        error: (response) =>
          # if this is a 404 error, move to registration
          if response.status == 404
            Backbone.trigger "sessions:do", "register", {email: data.email}
          # if it's another error, alert the message
          else
            alert "Error #{response.status}: #{response.statusText}"
        complete: =>
          $('input').removeAttr('disabled')
          @views.spinner.remove()

