Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.DetailView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  className: 'detail detail-show'

  template: JST['phonebook/templates/base/detail']

  events:
    'touchend .back': 'back'
    'touchmove .titlebar': (e) -> e.preventDefault()

  listen: ->

  show: (animation) ->
    console.log 'rendering detail view'
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    Backbone.trigger 'view:shown', 'detail'
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      @loadMore()

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model.unset('selected')
      @remove()
    )

  render: ->
    @$el.html(@template @model.tplAttrs())
    @$el.find('.scrollable').scrollTop(1)
    @

  loadMore: ->
    @model.fetch
      success: => @renderSubviews()

  renderSubviews: ->

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'table:index'

  removeSubviews: ->
    _.each @subviews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super
