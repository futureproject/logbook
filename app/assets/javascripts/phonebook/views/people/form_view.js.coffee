Phonebook.Views.People ||= {}

class Phonebook.Views.People.FormView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Person

  template: JST['phonebook/templates/people/form']

  events: ->
    'focus form' : (e) -> $('body').addClass('focusin')
    'blur form' : (e) -> $('body').removeClass('focusin')
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
        Backbone.trigger 'people:saved', @model
      error: (model) =>
        console.log model
