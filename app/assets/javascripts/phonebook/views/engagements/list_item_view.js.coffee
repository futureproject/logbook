class Phonebook.Views.Engagements.ListItemView extends Backbone.View
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  listen: ->
    @listenTo @model, 'change:date change:name change:kind', @render
    @listenTo @model, 'change:selected', @toggleActiveClass
    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'change:operating', @toggleControls

  events:
    'tap .delete' : 'delete'
    'tap' : 'ontap'
    'touchstart': ds.swiper.ontouchstart
    'touchmove': ds.swiper.ontouchmove
    'touchend': ds.swiper.ontouchend

  ontap: (e) ->
    e.gesture.srcEvent.preventDefault()
    if @model.has('operating')
      @model.unset('operating')
    else
      @model.set('selected', true)

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass('selected').attr('style','')
      Backbone.trigger 'engagements:selected', @model, @
    else
      @$el.removeClass 'selected'

  toggleControls: ->
    if @model.has('operating') then @showControls() else @hideControls()

  showControls: (e) ->
    @$el.transition({
      x: -120
    }, 200, 'easeOutBack')

  hideControls: (e) ->
    @$el.transition({
      x: 0
    }, 300, 'easeOutBack')

  delete: (e) ->
    e.gesture.srcEvent.preventDefault()
    @$el.addClass('deleting').transition({
      x: '-50%'
      scale: [1, .00001]
      complete: =>
        @model.destroy()
    })
