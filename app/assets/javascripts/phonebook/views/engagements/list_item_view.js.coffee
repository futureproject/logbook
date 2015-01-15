class Phonebook.Views.Engagements.ListItemView extends Phonebook.Views.Base.ListItemView
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()
    super

  render: ->
    @$el.html @template @model.tplAttrs()
    @

  listen: ->
    @listenTo @model, 'change:date change:name change:kind change:notes', @render
    @listenTo @model, 'change:selected', @toggleActiveClass
    @listenTo @model, 'destroy', @remove
    @events['tap'] = 'ontap'
    @listenTo @, 'controlTap', @duplicate

  ontap: (e) ->
    e.gesture.srcEvent.preventDefault()
    @model.set 'selected', true

  toggleActiveClass: ->
    if @model.has('selected')
      @$el.addClass('selected').attr('style','')
      Backbone.trigger 'engagements:selected', @model, @
    else
      @$el.removeClass 'selected'

  duplicate: (e) ->
    return unless e.target.classList.contains 'duplicate'
    Backbone.trigger 'engagements:duplicate', @model

