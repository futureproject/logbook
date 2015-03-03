class Phonebook.Views.Engagements.ListItemView extends Phonebook.Views.Base.ListItemView
  template: JST['phonebook/templates/engagements/list_item']
  className: 'list-item engagement'
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
    @listenTo @, 'controlTap', @duplicate
    @listenTo @, 'tapped', @ontap

  ontap: (e) ->
    @model.set 'selected', true
    Backbone.trigger 'engagements:show', @model

  duplicate: (e) ->
    return unless e.target.classList.contains 'duplicate'
    Backbone.trigger 'engagements:duplicate', @model

  onModelChange: (e) ->
    relevant = false
    attrs = ['name', 'date', 'selected']
    console.log @model.get('selected')
    changedAttrs = @model.changedAttributes()
    @render() if relevant
