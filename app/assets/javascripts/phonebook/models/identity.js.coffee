class ds.Identity extends Backbone.Model
  setup: ->
    attrs = localStorage.getItem('identity')
#   parse user data as JSON if there is any
    attrs = if attrs? then JSON.parse(attrs) else {}
    @set attrs
    if @get('person')?.id
      @broadcastStatus()
    else
      # ajax to me_path,
      $.ajax
        dataType: "json"
        url: ds.apiHelper.urlFor("me")
        success: (response) =>
          # set attributes locally and trigger
          @save response
          @broadcastStatus()
        error: (response) =>
          Backbone.trigger "app:authenticate"

  save: (data) ->
    localStorage.setItem "identity", JSON.stringify(data)
    @set data

  broadcastStatus: ->
    person = @get('person')
    if person.id?
      Backbone.trigger "app:auth_complete"
    else
      Backbone.trigger "app:register"

