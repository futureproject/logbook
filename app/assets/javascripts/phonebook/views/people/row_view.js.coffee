class Phonebook.Views.People.RowView extends Phonebook.Views.Base.RowView
  template: JST['phonebook/templates/people/row']
  className: 'row person'
  initialize: ->
    @model ||= new Phonebook.Models.Person
    @listen()
    super

  render: ->
    @$el.html @template @model.tplAttrs()
    @$el.toggleClass 'selected', @model.has('selected')
    @

  listen: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'destroy', @remove
    @listenTo @, 'tapped', @ontap
    @events['click .delete'] = @delete

  ontap: (e) ->
    @model.set 'selected', true
    Backbone.trigger 'people:show', @model

  open: ->
  close: ->

  delete: (e) ->
    @close()
    e.preventDefault()
    e.stopPropagation()
    @el.style['-webkit-transition-property'] = "-webkit-transform"
    @el.style['-webkit-transition-duration'] = '.5s'
    @el.style['-webkit-transform'] = 'translate3d(-200%,0,0)'
    @$el.addClass('deleting').one('webkitTransitionEnd', =>
      @model.destroy()
    )