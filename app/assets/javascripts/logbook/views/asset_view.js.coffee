class ds.AssetView extends Backbone.View
  initialize: ->
    @listenTo @model, 'destroy', @animateOut

  className: ->
   "sticky asset"

  template: JST["logbook/templates/asset"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @

  events:
    'click .delete': 'delete'

  delete: (event) ->
    if (confirm('Are you sure you want to delete this attachment?'))
      @model.destroy()
      return true
    else
      event.preventDefault()
      return false

  animateOut: ->
    @$el.animate {
      opacity: 0
    }, => @hide()
