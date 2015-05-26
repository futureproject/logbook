class Phonebook.Views.Projects.RowView extends Phonebook.Views.Base.RowView
  template: JST['phonebook/templates/projects/row']
  initialize: ->
    @model ||= new Phonebook.Models.Project
    @listen()
    super

  render: ->
    @$el.html(@template @model.tplAttrs()).attr('class', @className())
    @

  listen: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'destroy', @remove
    @listenTo @, 'tapped', @ontap
    @events['click .delete'] = @delete

  ontap: (e) ->
    @model.set 'selected', true
    Backbone.trigger 'projects:show', @model

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
