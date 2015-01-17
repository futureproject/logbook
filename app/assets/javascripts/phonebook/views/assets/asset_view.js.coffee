Phonebook.Views.Assets ||= {}

class Phonebook.Views.Assets.AssetView extends Backbone.View
  template: JST['phonebook/templates/assets/asset']
  className: 'asset'
  initialize: ->
    @listenTo @model, 'destroy', @hide

  events:
    'tap' : 'toggleControls'
    'tap .delete': -> @model.destroy()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  hide: ->
    Backbone.trigger 'asset:destroyed', @model
    @$el.addClass('collapse').one('webkitAnimationEnd', => @$el.remove() )

  toggleControls: -> @$el.toggleClass('controls-showing')

