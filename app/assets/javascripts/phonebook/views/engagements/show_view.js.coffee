Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @$container = args.container
    @listen()

  template: JST['phonebook/templates/engagements/show']

  className: 'detail detail-show'

  events:
    'tap .back': 'back'
    'tap .edit': -> Backbone.trigger 'engagements:edit', @model
    'tap .upload': 'showUploads'
    'touchmove .detail-title': (e) -> e.preventDefault()
    #'blur .editable': 'saveContent'

  listen: ->

  show: (animation) ->
    console.log 'rendering show view'
    animation ||= 'slide-in-horizontal'
    @$container.append @$el.addClass(animation)
    @render()
    @$el.one 'webkitAnimationEnd', =>
      @$el.removeClass(animation)
      if @model.has('attendees')
        @renderSubviews()
      else
        @loadMore()
    Backbone.trigger 'engagements:router:update', (@model.id || @model.cid)
    Backbone.trigger 'engagements:views:shown', 'detail'

  hide: (animation) ->
    animation ||= 'slide-out-horizontal'
    @$el.addClass(animation).one('webkitAnimationEnd', () =>
      @model.unset('selected')
      @remove()
    )
    Backbone.trigger('engagements:views:hidden', @)

  render: ->
    @$el.html(@template @model.tplAttrs())
    @showInfo()
    @

  loadMore: ->
    @model.fetch
      success: => @renderSubviews()

  renderSubviews: ->
    @subviews =
      attendance_card: new Phonebook.Views.Engagements.AttendanceCardView
        el: @$el.find('.engagement-attendance')
        model: @model
      assets_card: new Phonebook.Views.Engagements.AssetsCardView
        el: @$el.find('.engagement-assets')
        model: @model
    _.each @subviews, (view) -> view.render()

  showInfo: ->
    @$infoView ||= new Phonebook.Views.Engagements.InfoView
      el: @$el.find('.engagement-info')
      model: @model
    @$infoView.render()

  back: ->
    Backbone.trigger 'engagements:index'

  removeSubviews: ->
    _.each @subviews, (view) -> view.remove()

  remove: ->
    @removeSubviews()
    super
