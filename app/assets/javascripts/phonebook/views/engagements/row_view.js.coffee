class Phonebook.Views.Engagements.RowView extends Phonebook.Views.Base.RowView
  template: JST['phonebook/templates/engagements/row']
  className: 'row engagement'
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
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
    @events['click .duplicate'] = @duplicate
    @events['click .delete'] = @delete

  ontap: (e) ->
    @model.set 'selected', true
    Backbone.trigger 'engagements:show', @model

  duplicate: (e) ->
    console.log 'duplicating'
    @close()
    return unless e.target.classList.contains 'duplicate'
    Backbone.trigger 'engagements:duplicate', @model

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
