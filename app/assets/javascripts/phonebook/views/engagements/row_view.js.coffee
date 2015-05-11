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
    @listenTo @, 'tapped', @ontap
    @events['click .duplicate'] = @duplicate
    @events['click .delete'] = @delete

  ontap: (e) ->
    @model.set 'selected', true
    Backbone.trigger 'engagements:show', @model

  duplicate: (e) ->
    @close()
    return unless e.target.classList.contains 'duplicate'
    Backbone.trigger 'engagements:duplicate', @model

  delete: (e) ->
    @close()
    e.preventDefault()
    e.stopPropagation()
    @model.destroy()
