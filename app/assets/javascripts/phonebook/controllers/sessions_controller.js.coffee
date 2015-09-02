class ds.SessionsController extends Backbone.View
  initialize: ->
    @views = {}
    @listenTo Backbone, "sessions:do", @do

  do: (fn, args) ->
    _.each @views, (view) -> view.hide()
    @[fn]?(args)

  new: ->
    @views.new = new ds.SessionsNewView
    @views.new.renderTo "#phonebook"

  register: (attrs) ->
    @views.registration = new ds.SessionsRegistrationView
      model: new ds.Person(_.extend attrs, { role: 'volunteer' })
    @views.registration.renderTo "#phonebook"
