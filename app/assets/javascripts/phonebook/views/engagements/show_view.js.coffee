Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @listen()

  template: JST['phonebook/templates/engagements/show']

  events:
    'tap .back': 'animateOut'
    'swiperight': 'animateOut'
    'tap .edit': -> Backbone.trigger 'engagements:editing', @model, @
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
    @animateIn(view)
    Backbone.trigger 'engagements:views:shown', @

  hide: ->
    @model?.unset('selected')
    @$el.removeClass('active').attr('style','')

  animateIn: (view) ->
    @$el.addClass('active')

  animateOut: ->
    Backbone.trigger 'engagements:views:hidden', @ #announce that this view got hid
    @$el.removeClass('active').one('webkitTransitionEnd', () =>
      @hide()
    )

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
