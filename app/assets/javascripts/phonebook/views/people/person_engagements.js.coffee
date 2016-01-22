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
    @listenToOnce Backbone, 'engagements:found', (localModels) =>
      remote = @model.get('engagements') || []
      list = new ds.EngagementsCollection(localModels)
      list.add remote
      for e in list.models
        view = new ds.EngagementListItemView
          model: e
        @views.push view
        frag.appendChild view.render().el
      @$el.find('#engagements-list').html(frag)
      @
    # ping the engagements collection for models created this session
    Backbone.trigger "engagements:find", {
      query_type: "attendee_ids",
      query: @model.id
    }

  addEngagement: ->
    Backbone.trigger 'people:action', 'add_engagement', @model.id
