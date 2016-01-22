class ds.EngagementListItemView extends Backbone.View
  tagName: 'li'
  template: JST['phonebook/templates/engagements/list_item']
  render: ->
    @$el.html @template(@model.tplAttrs())
    @

