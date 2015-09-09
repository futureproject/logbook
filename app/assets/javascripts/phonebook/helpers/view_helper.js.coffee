Backbone.View.prototype.renderTo = (target, args) ->
  args ||= {}
  if args.replace
    $(target).empty().append(this.el)
  else
    $(target).append(this.el)
  this.render()

Backbone.View.prototype.hide = ->
  _.each(@views, (view) -> view.remove() )
  @remove()

