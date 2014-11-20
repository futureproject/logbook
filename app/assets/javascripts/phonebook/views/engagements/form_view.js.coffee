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
    # save the model
    # if new, add it to the collection
    # and if save works, do these
    @model.unset 'selected'
    @remove()
