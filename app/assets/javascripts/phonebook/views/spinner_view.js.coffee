class ds.SpinnerView extends Backbone.View
  className: 'lb-loading'
  render: ->
    setTimeout () =>
      @remove()
    , 5000
    @
