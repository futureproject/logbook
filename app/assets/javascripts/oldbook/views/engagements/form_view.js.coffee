Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.FormView extends Backbone.View
  initialize: ->
    @model ||= new Phonebook.Models.Engagement

  template: JST['oldbook/templates/engagements/form']

  events: ->
    'focus form' : (e) -> $('body').addClass('focusin')
    'blur form' : (e) -> $('body').removeClass('focusin')
    'submit' : 'submit'
    'click .attendance' : -> Backbone.trigger 'engagements:attendance', @model
    'change #kind' : (e) ->
      kind = $(e.target).val().toLowerCase().replace(' ', '-')
      @$el.find('form').attr('data-kind', kind)

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
        Backbone.trigger 'engagements:saved', @model
      error: (model) =>
        console.log model

