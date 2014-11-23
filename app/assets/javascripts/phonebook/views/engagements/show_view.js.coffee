Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @listen()

  template: JST['phonebook/templates/engagements/show']

  events:
    'tap .back': 'animateOut'
    'tap .edit': -> Backbone.trigger 'engagements:editing', @model, @
    'swiperight': -> ds.animator.outRight(@)
    'touchmove .detail-title': (e) -> e.preventDefault()
    'blur .editable': 'saveContent'

  listen: ->
    @listenTo Backbone, 'engagements:selected', @show

  show: (model, view) ->
    @model = model
    return unless @model?
    Backbone.trigger 'engagements:router:update', @model.get('id')
    @model.set 'selected', true
    @render()
    if view
      @animateIn(view)
    else
      @showSansAnimation()
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset('selected')
    @$el.removeClass('active').attr('style','')

  animateIn: (view) ->
    @originalPosition = view.el.getBoundingClientRect()
    @$el.addClass 'active'

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

  showSansAnimation: ->
    @$el.addClass('active').attr('style','')

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  saveContent: (e) ->
    window.scroll(0,0)
    key = e.currentTarget.getAttribute('name')
    val = e.currentTarget.value
    attrs = {}
    attrs["#{key}"] = val
    if @model.get(key) != val
      @model.save(attrs)
