ds.animator =
  outRight: (view, namespace) ->
    namespace ||= "engagements"
    Backbone.trigger "#{namespace}:views:hidden", view #announce that this view got hid
    view.$el.transition
      x: '100%'
      y: 0
      opacity: 0
      complete: =>
        view.hide?.call(view)
