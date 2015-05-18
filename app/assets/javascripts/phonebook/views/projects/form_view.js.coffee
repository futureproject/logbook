Phonebook.Views.Projects ||= {}

class Phonebook.Views.Projects.FormView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Project

  template: JST['phonebook/templates/projects/form']

  events: ->
    'focus form' : (e) -> $('body').addClass('focusin')
    'blur form' : (e) -> $('body').removeClass('focusin')
    'click .attendance' : -> Backbone.trigger 'engagements:attendance', @model
    'submit' : 'submit'

  render: ->
    @$el.html @template @model.tplAttrs()
    @el.parentNode?.scrollTop = 1
    Backbone.Syphon.deserialize @, @model.tplAttrs()
    @

  submit: (e) ->
    e.preventDefault()
    $('body').removeClass 'focusin'
    data = Backbone.Syphon.serialize @
    @model.save data,
      success: (e) =>
        Backbone.trigger 'projects:saved', @model
      error: (model) =>
        console.log model
