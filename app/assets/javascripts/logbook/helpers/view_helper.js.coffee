Backbone.View.prototype.renderTo = (target) ->
  $(target).empty().append this.el
  this.render()

