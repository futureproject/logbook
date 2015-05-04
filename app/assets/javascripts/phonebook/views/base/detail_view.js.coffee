Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.DetailView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @render()
    @initSubViews()

    @listen()

  className: 'detail detail-show'

  template: JST['phonebook/templates/base/detail']

  events:
    'touchend .back': 'back'
    'touchmove .titlebar': (e) -> e.preventDefault()

  listen: ->

  initSubViews: ->
    @subViews ||= {}
    #header view renders automatically
    @subViews.header = new Phonebook.Views.Base.ModelView
      model: @model
      el: @el.querySelector('header')
      template: @header_template

  show: (animation) ->
    console.log 'rendering detail view'
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    Backbone.trigger 'view:shown', 'detail'
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      @loadMore()

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @remove()
    )

  render: ->
    @$el.html(@template @model.tplAttrs())
    @$el.find('.scrollable').scrollTop(1)
    @trigger 'rendered'

  loadMore: ->
    @model.fetch()

  back: (e) ->
    e.stopPropagation()
    Backbone.trigger 'table:index'

  removeSubviews: ->
    _.each @subviews, (view) -> view.remove()

  remove: ->
    @model.unset('selected')
    @removeSubviews()
    super
