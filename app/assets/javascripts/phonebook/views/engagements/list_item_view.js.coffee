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

  events:
    'tap .delete' : 'delete'
    'tap' : 'ontap'
    'touchstart': ds.swiper.ontouchstart
    'touchmove': ds.swiper.ontouchmove
    'touchend': ds.swiper.ontouchend

  ontap: (e) ->
    @model.set('selected', true) unless @model.has('operating')
    e.gesture.srcEvent.preventDefault()

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass('selected').attr('style','')
      Backbone.trigger 'engagements:selected', @model, @
    else
      @$el.removeClass 'selected'

  delete: (e) ->
    e.gesture.srcEvent.preventDefault()
    @$el.addClass('deleting').transition({
      x: '-50%'
      scale: [1, .00001]
      complete: =>
        @model.destroy()
    })
