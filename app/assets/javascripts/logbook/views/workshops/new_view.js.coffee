dream.Views.Workshops ||= {}

class dream.Views.Workshops.NewView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'workshop:new', @display
    @listenTo Backbone, 'workshop:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/workshops/new']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: () ->
    return if @$el.is(':visible')
    @model = new dream.Models.Workshop
    @render()
    $('#kind').selectize
      delimeter: ','
      options: [{name: 'Coaching Session'}, {name: 'Workshop'}, {name:'Event'}]
      valueField: 'name'
      labelField: 'name'
      maxItems: 1
      create: (input) -> { name: input }
    Backbone.trigger 'router:update', "logbook/workshops/new"
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      $('select').selectize
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
    Backbone.trigger 'router:update', 'logbook/workshops'

  done: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    data.attendee_ids = [''] if data.attendee_ids == null
    data.date = Date.parse(data.date).toString('yyyy-MM-dd')
    @model.save data,
      success : (workshop) =>
        Backbone.trigger 'workshop:created', @model
        Backbone.trigger 'workshop:show', @model
      error: (e) =>
        console.log e
