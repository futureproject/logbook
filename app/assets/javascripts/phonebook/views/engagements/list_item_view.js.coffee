class ds.EngagementListItemView extends Backbone.View
  initialize: ->
    @listenTo @model, 'destroy', @hide
  tagName: 'li'
  template: JST['phonebook/templates/engagements/list_item']
  className: ->
    cls = "engagements-list-item"
    cls += " deletable" if @model.has('stored_in_session')
    cls
  render: ->
    @$el.html @template(@model.tplAttrs())
    @

  events:
    'click .delete': 'delete'

  delete: ->
    Backbone.trigger 'session_storage:engagements:destroy', @model

