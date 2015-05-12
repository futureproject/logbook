Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.DetailView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @namespace = args.namespace || 'base'
    @render()
    @initSubViews()
    @listen()

  className: 'detail detail-show'

  template: JST['phonebook/templates/base/detail']

  listen: -> #noop

  events:
    'touchend .back': 'back'
    'touchmove .titlebar': (e) -> e.preventDefault()
    'touchend .edit': 'triggerEdit'
    'click .trigger-edit': 'triggerEdit'

  initSubViews: ->
    @subViews ||= {}

    #ModelViews render automatically
    @subViews.header = new Phonebook.Views.Base.ModelView
      model: @model
      el: @el.querySelector('header')
      template: @header_template

  show: (animation) ->
    console.log 'rendering detail view'
    animation ||= 'slide-in-horizontal'
    Backbone.trigger "#{@namespace}:router:update", (@model.id || @model.cid)
    Backbone.trigger "#{@namespace}:views:shown", 'detail'
    @$container.append @$el.addClass(animation)
    Backbone.trigger 'view:shown', 'detail'
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      @loadMore()

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    Backbone.trigger "#{@namespace}:views:hidden", @
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )

  render: ->
    @$el.html(@template @model.tplAttrs())
    @$el.find('.scrollable').scrollTop(1)

  loadMore: ->
    @model.fetch()

  back: (e) ->
    e.stopPropagation()
    e.preventDefault()
    Backbone.trigger "#{@namespace}:index"

  removeSubviews: ->
    _.each @subViews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super

  triggerEdit: (event) =>
    event.preventDefault()
    Backbone.trigger "#{@namespace}:edit", @model
