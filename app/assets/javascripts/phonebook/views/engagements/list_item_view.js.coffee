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
    @listenTo @model, 'change:date change:name change:kind change:notes', @render
    @listenTo @model, 'change:selected', @toggleActiveClass
    @listenTo @model, 'destroy', @remove

  events:
    #'tap' : 'ontap'
    'touchstart': ds.swiper.ontouchstart
    'touchmove': ds.swiper.ontouchmove
    'touchend .delete' : ds.swiper.delete
    'touchend': ds.swiper.ontouchend
    'close': ds.swiper.close
    'mouseup': ds.swiper.ontouchend

  ontap: (e) ->

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass('selected').attr('style','')
      Backbone.trigger 'engagements:selected', @model, @
    else
      @$el.removeClass 'selected'

