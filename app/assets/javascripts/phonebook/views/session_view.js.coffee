class ds.SessionView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'sessions:new', @show

  show: ->
    $("body").html "<p>Please sign in</p>"
