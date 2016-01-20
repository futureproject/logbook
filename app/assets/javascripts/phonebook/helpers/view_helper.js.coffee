Backbone.View.prototype.renderTo = (target, args) ->
  args ||= {}
  if args.replace
    $(target).empty().append(this.el)
  else
    $(target).append(this.el)
  this.render()

Backbone.View.prototype.hide = ->
  endEvent = ds.ANIMATION_END_EVENT
  hidingAnimation = @hidingAnimation || "animation-fallout"
  if endEvent?
    # remove animation classes
    prefix = "animation"
    classes = @el.className.split(" ")
    classes = classes.filter (css_class) ->
      css_class.lastIndexOf(prefix, 0) != 0
    @el.className = $.trim(classes.join(" "))
    @$el.one(endEvent, =>
      _.each(@views, (view) -> view.remove() )
      @remove()
    ).addClass(hidingAnimation)
  else
    _.each(@views, (view) -> view.remove() )
    @remove()
