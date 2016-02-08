class ds.PersonEngagementsView extends Backbone.View
  template: JST["phonebook/templates/people/person_engagements"]
  initialize: ->
    @views = []
    @collection = new ds.EngagementsCollection
    @collection.comparator = (model) ->
      - Date.parse(model.get("date"))
    @listenTo @model, 'change:engagements', @refreshEngagements
    @listenTo @collection, 'reset', @render
    @refreshEngagements()

  events:
    'click .action-header': 'addEngagement'

  refreshEngagements: (arg) ->
    serverEngagements = @model.get('engagements')
    # is it OK to reference another controller explicitly?
    # maybe refactor to make this evented?
    localEngagements = ds.controllers.session_storage.collections.engagements.getByAttendeeIds @model.id
    total = _.uniq localEngagements.concat(serverEngagements)
    @collection.reset total

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
