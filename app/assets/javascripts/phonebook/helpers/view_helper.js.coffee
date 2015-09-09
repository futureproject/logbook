Backbone.View.prototype.renderTo = (target, args) ->
  args ||= {}
  if args.replace
    $(target).empty().append(this.el)
  else
    $(target).append(this.el)
  this.render()

Backbone.View.prototype.hide = ->
  endEvent = ds.animationHelper.endEvent()
  @$el.removeClass (index, css) ->
    css.match((/(^|\s)animation-\S+/g) || [])?.join(' ')
  @$el.one(endEvent, =>
    _.each(@views, (view) -> view.remove() )
    @remove()
  ).addClass('animation-fallout')

