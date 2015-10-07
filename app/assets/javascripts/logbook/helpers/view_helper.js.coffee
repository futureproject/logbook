Backbone.View.prototype.renderTo = (target) ->
  $(target).empty().append(this.el)
  this.render()

Backbone.View.prototype.hide = ->
  _.each(@views, (view) -> view.hide() )
  @remove()

