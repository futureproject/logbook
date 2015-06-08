window.ds ||= {}

class ds.GraphView extends Backbone.View
  initialize: (args) ->
    return unless args?.url
    @url = args.url
    @load()

  load: ->
    $.ajax
      dataType: 'json'
      url: @url
      success: (response) ->
        console.log response
        console.log @

  #render: ->
    #console.log 'rendered!'
