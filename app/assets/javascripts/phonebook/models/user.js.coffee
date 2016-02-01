class ds.User extends Backbone.Model
  authenticate: ->
    endpoint = "https://accounts.google.com/o/oauth2/v2/auth"
    params =
      response_type: "token"
      client_id: "163075849648-es7p2gfv54tqpdmb4vdd561mst80jvno.apps.googleusercontent.com"
      nonce: "whaaaaaa"
      redirect_uri: "/auth/google_oath2/callback"
      login_hint: "chris.frank@thefutureproject.org"
      scope: "profile"
    $.ajax
      url: endpoint
      data: params
      crossDomain: true
      success: (event, etc, etcetc) ->
        console.log event
        console.log etc
        console.log etcetc


