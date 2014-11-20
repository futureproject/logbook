ds.animator =
  outRight: (view) ->
    view.$el.transition
      x: '100%'
      y: 0
      opacity: 0
      complete: =>
        view.hide?.call(view)
