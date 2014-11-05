dream.Views.Engagements ||= {}

class dream.Views.Engagements.NewView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'engagement:new', @display
    @listenTo Backbone, 'engagement:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/engagements/new']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: () ->
    return if @$el.is(':visible')
    @model = new dream.Models.Engagement
    @render()
    @$el.find('#kind').selectize
      delimeter: ','
      options: [{name: 'Coaching Session'}, {name: 'Workshop'}, {name:'Event'}, {name:'Meeting'}]
      valueField: 'name'
      labelField: 'name'
      maxItems: 1
      create: (input) -> { name: input }
    Backbone.trigger 'router:update', "logbook/engagements/new"
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      @$el.find('#attendee_ids').selectize
        options: collection.models.map (model) -> model.selectizeAttrs()
        valueField: 'id'
        labelField: 'name'
        plugins: ['fast-click']
        searchField: ['first_name', 'last_name']
        sortField: [
          {"field": "dream_team", "direction": "desc"},
          {"field": "first_name", "direction": "asc"},
        ]
    Backbone.trigger 'people:bootstrap'

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'router:update', 'logbook/engagements'

  done: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    data.attendee_ids = [''] if data.attendee_ids == null
    data.date = Date.parse(data.date).toString('yyyy-MM-dd')
    @model.save data,
      success : (engagement) =>
        Backbone.trigger 'engagement:created', @model
        Backbone.trigger 'engagement:show', @model
      error: (e) =>
        console.log e
