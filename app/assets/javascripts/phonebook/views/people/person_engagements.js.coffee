class ds.PersonEngagementsView extends Backbone.View
  template: JST["phonebook/templates/people/person_engagements"]
  initialize: ->
    @views = []
    @listenTo @model, 'change:engagements', @render

  events:
    'click .action-header': 'addEngagement'

  render: ->
    @$el.html @template(@model.tplAttrs())
    frag = document.createDocumentFragment()
    list = @model.get('engagements') || []
    for e in list
      model = new ds.Engagement(e)
      view = new ds.EngagementListItemView
        model: model
      @views.push view
      frag.appendChild view.render().el
    @$el.find('#engagements-list').html(frag)
    @

  addEngagement: ->
    Backbone.trigger 'people:action', 'add_engagement', @model.id
