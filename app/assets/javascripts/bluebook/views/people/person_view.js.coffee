Bluebook.Views.People ||= {}

class Bluebook.Views.People.PersonView extends Backbone.View
  template: JST["bluebook/templates/people/person"]

  initialize: ->
    @listenTo Backbone, 'people:show', @toggleClass
    @listenTo Backbone, 'people:getScrollPos', @sendScroll

  events:
    "click" : "show"

  #tagName: "li"

  show: () ->
    Backbone.trigger 'route:go', "/bluebook/people/#{@model.get('id')}"
    Backbone.trigger 'people:show', @model

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  toggleClass: (person) ->
    if person == @model
      @el.classList.add 'is_active'
    else
      @el.classList.remove 'is_active'

  sendScroll: (person) ->
    if person == @model
      Backbone.trigger 'people:scrollTo', @$el.offset().top
