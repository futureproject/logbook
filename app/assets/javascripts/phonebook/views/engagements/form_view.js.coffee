Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.FormView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Engagement

  template: JST['phonebook/templates/engagements/form']

  events: ->
    'focus form' : (e) -> $('body').addClass('focusin')
    'blur form' : (e) -> $('body').removeClass('focusin')
    'submit' : 'submit'

  render: ->
    @$el.html @template @model.tplAttrs()
    Backbone.Syphon.deserialize @, @model.tplAttrs()
    @$el.find('input').first().focus()
    @

  submit: (e) ->
    e.preventDefault()
    $('body').removeClass 'focusin'
    data = Backbone.Syphon.serialize @
    @model.save data,
      success: (e) =>
        Backbone.trigger 'engagements:saved', @model
        @model.unset 'new'
      error: (e) =>
        console.log e

