Backbone.View.prototype.renderTo = (target) ->
  window.scrollTo(0,0)
  $(target).empty().append(this.el)
  this.render()
Backbone.View.prototype.hide = ->
  _.each(@views, (view) -> view.remove() )
  @remove()

