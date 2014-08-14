class dream.Models.Stat extends Backbone.Model
  urlRoot: '/stats'

  validate: (attrs) ->
    return 'Name me!' if !attrs.first_name? || !attrs.last_name?

  name: -> "#{@get('first_name')} #{@get('last_name')}"

  selectizeAttrs: ->
    {
      first_name: @get('first_name')
      last_name: @get('last_name')
      id: @get('id')
      dream_team: @get('dream_team')
      name: @name()
    }

class dream.Collections.Stats extends Backbone.Collection
  initialize: ->
    @bootstrap()
    @on 'reset', @broadcast
    @listenTo Backbone, 'stats:bootstrap', @bootstrap

  model: dream.Models.Stat

  url: '/stats'

  broadcast: -> Backbone.trigger 'stats:changed', @

  # fetch new data from the server
  # broadcast models
  refresh: (e) ->
    return unless navigator.onLine
    @fetch
      remote: true
      success: => @broadcast()

  # fetch this collection from localStorage
  fetchLocal: ->
    @fetch
      remote: false
      reset: true

  # get models into this collection
  # pull from localStorage first
  # if that comes up empty, pulls from network
  bootstrap: ->
    @fetch
      remote: false
      success: =>
        if @length > 0
          @broadcast()
        else
          @fetch
            remote: true
            success: =>
              @broadcast()
