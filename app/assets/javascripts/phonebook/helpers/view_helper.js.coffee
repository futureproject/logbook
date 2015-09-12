Backbone.View.prototype.renderTo = (target, args) ->
  args ||= {}
  if args.replace
    $(target).empty().append(this.el)
  else
    $(target).append(this.el)
  this.render()

Backbone.View.prototype.hide = ->
  endEvent = ds.ANIMATION_END_EVENT
  if endEvent?
    prefix = "animation"
    classes = @el.className.split(" ")
    classes = classes.filter (css_class) ->
      css_class.lastIndexOf(prefix, 0) != 0
    @el.className = $.trim(classes.join(" "))
    @$el.one(endEvent, =>
      _.each(@views, (view) -> view.remove() )
      @remove()
    ).addClass('animation-fallout')
  else
    _.each(@views, (view) -> view.remove() )
    @remove()
