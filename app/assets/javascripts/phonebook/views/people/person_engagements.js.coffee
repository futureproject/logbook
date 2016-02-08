class ds.PersonEngagementsView extends Backbone.View
  template: JST["phonebook/templates/people/person_engagements"]
  initialize: ->
    @views = []
    @collection = new ds.EngagementsCollection
    @listenTo @model, 'change:engagements', @refreshEngagements
    @listenTo @collection, 'reset', @render
    @refreshEngagements()
    #Backbone.trigger "session_storage:engagements:find", {
      #query_type: "attendee_ids",
      #query: @model.id
    #}

  events:
    'click .action-header': 'addEngagement'

  refreshEngagements: (arg) ->
    #serverEngagements = @model.get('engagements')
    localEngagements = ds.controllers.session_storage.collections.engagements.getByAttendeeIds @model.id
    #total = _.uniq localEngagements.concat(serverEngagements)
    @collection.reset localEngagements

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    frag = document.createDocumentFragment()
    @collection.each (model) => @renderOne(model, frag)
    @$el.find('#engagements-list').html(frag)

  renderOne: (model, fragment) ->
    view = new ds.EngagementListItemView
      model: model
    @views.push view
    fragment.appendChild view.render().el

  addEngagement: ->
    Backbone.trigger 'people:action', 'add_engagement', @model.id
