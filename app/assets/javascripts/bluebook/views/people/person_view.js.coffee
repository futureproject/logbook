Bluebook.Views.People ||= {}

class Bluebook.Views.People.PersonView extends Backbone.View
  template: JST["bluebook/templates/people/person"]

  initialize: ->
    @listenTo Backbone, 'people:show', @toggleClass
    @listenTo Backbone, 'people:edit', @toggleClass
    @listenTo Backbone, 'people:getScrollPos', @sendScroll

  className: 'list-item'

  events:
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    'touchend': 'ontouchend'
    'click': 'show'

  ontouchstart: (e) ->
    @deltaY = 0
    @startY = e.originalEvent.touches[0].screenY
    @('.detail-frame').append('started')

  ontouchmove: (e) ->
    @deltaY = Math.abs(e.originalEvent.touches[0].screenY - @startY)

  ontouchend: (e) ->
    if @deltaY < 5
      @show()

  show: () ->
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
