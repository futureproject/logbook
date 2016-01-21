class ds.ModelView extends Backbone.View
  initialize: (args) ->
    @template = args.template
    @listenTo @model, 'change', @render

  render: ->
    @$el.html(@template @model.tplAttrs())
    @delegateEvents()
    @

