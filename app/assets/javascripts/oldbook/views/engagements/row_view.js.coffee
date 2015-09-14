class Phonebook.Views.Engagements.RowView extends Phonebook.Views.Base.RowView
  template: JST['oldbook/templates/engagements/row']
  initialize: ->
    @model ||= new Phonebook.Models.Engagement
    @listen()
    super

  render: ->
    @$el.html(@template @model.tplAttrs()).attr('class', @className())
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
