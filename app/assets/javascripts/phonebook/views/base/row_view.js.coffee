Phonebook.Views.Base ||= {}

class Phonebook.Views.Base.RowView extends Backbone.View
  initialize: ->
    @listenTo Backbone, 'row:opened', @beforeOpen
    @listenTo Backbone, 'row:closed', @afterClose
    @listenTo @model, 'destroy', @onDestroy
    @canTap = true

  className: ->
    c = "row #{@model.className.toLowerCase()}"
    c += " createable" if @model.isNew()
    c += " selected" if @model.has('selected')
    c

  events:
    # prevent touches on controls from propogating to the general listeners
    'touchstart .row-controls': (e) ->
      e.stopPropagation()
      @startPos.t = e.timeStamp
    'touchend .row-controls': (e) -> e.stopPropagation()
    # do the general touch listener stuff
    'touchstart': 'ontouchstart'
    'touchmove': 'ontouchmove'
    'touchend': 'ontouchend'

  ontouchstart: (e) ->
    Backbone.trigger 'row:touchstart', e
    @isScrolling = null
    @startPos =
      x: e.originalEvent?.touches?[0].screenX || e.screenX
      y: e.originalEvent?.touches?[0].screenY || e.screenY
      t: e.timeStamp
    @calculatePositions(e)

  ontouchmove: (e) ->
    return unless @startPos
    @calculatePositions(e)

    @isScrolling = !!(@isScrolling || Math.abs(@diff.y) > Math.abs(@diff.x))

    return if @isScrolling
    e.preventDefault()
    if @diff.x < -60
      @open(e)

  ontouchend: (e) ->
    return if @isScrolling || !@startPos?
    e.preventDefault()
    e.stopPropagation()
    @diff.t = e.timeStamp - @startPos.t
    distanceMoved = Math.sqrt(@diff.x * @diff.x + @diff.y * @diff.y) || 0
    if (distanceMoved == 0 && @diff.t < 300 && @canTap)
      if @model.isNew()
        @model.save @model.attributes,
          success: =>
            Backbone.trigger "#{@model.namespace}:saved}", @model
      @trigger('tapped')

  beforeOpen: (view) ->
    @canTap = false

  open: (e) ->
    return unless @canTap
    Backbone.trigger 'row:opened', @
    @$el.addClass('row-open').find('.row-controls').addClass('slide-in-horizontal')
    @listenToOnce Backbone, 'row:touchstart', @close

  close: (e) ->
    @$el.find('.row-controls').removeClass('slide-in-horizontal').addClass('slide-out-horizontal').one('webkitAnimationEnd', =>
      @$el.removeClass('row-open').find('.row-controls').removeClass('slide-out-horizontal')
      Backbone.trigger 'row:closed', @
    )

  afterClose: (view) ->
    @canTap = true

  calculatePositions: (e) ->

    @currentPos =
      x: e.originalEvent?.touches?[0].screenX || e.screenX
      y: e.originalEvent?.touches?[0].screenY || e.screenY
      t: e.timeStamp

    @diff =
      x: @currentPos.x - @startPos.x
      y: @currentPos.y - @startPos.y
      t: @currentPos.t - @startPos.t


  onDestroy: ->
    @el.style['-webkit-transition-property'] = "-webkit-transform"
    @el.style['-webkit-transition-duration'] = '.5s'
    @el.style['-webkit-transform'] = 'translate3d(-200%,0,0)'
    @$el.addClass('deleting').one('webkitTransitionEnd', => @remove() )
