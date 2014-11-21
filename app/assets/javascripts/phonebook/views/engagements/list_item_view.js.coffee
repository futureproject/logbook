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
    'swipeleft': -> @model.set('operating', true)
    'swiperight': -> @model.unset('operating')

  ontap: ->
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
    @el.classList.add('controls-showing')

  hideControls: (e) ->
    @el.classList.remove('controls-showing')

  delete: (e) ->
    @$el.css({'min-height': '0', overflow: 'hidden', height: @$el.height() + 'px' }).transition({
      height: '0px'
      padding: '0 10px'
      complete: =>
        @model.destroy()
    }, 200)



