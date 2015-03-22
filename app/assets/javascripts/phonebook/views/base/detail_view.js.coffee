Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.DetailView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  className: 'detail detail-show'

  events:
    'touchend .back': 'back'
    'touchmove .titlebar': (e) -> e.preventDefault()

  listen: ->

  show: (animation) ->
    console.log 'rendering show view'
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @loadMore()
      #Backbone.trigger 'router:update', (@model.id || @model.cid)
      #Backbone.trigger 'view:shown', 'detail'

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model.unset('selected')
      @remove()
    )
    Backbone.trigger('view:hidden', @)

  render: ->
    @$el.html(@template @model.tplAttrs())
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
