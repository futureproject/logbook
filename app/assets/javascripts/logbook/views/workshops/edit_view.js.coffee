dream.Views.Workshops ||= {}

class dream.Views.Workshops.EditView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'workshop:edit', @display
    @listenTo Backbone, 'workshop:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/workshops/edit']

  events:
    'click .cancel': 'cancel'
    'click .warning': 'delete'
    'submit': 'done'

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/workshops/#{@model.get('id')}/edit"
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
      Backbone.Syphon.deserialize @, @model.attributes
      $('option[selected]').attr('selected', 'selected')
    Backbone.trigger 'people:bootstrap'

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'workshop:show', @model

  delete: (e) ->
    return unless confirm("Do you really want to delete this workshop?")
    Backbone.trigger 'workshop:destroy', @model
    @hide()

  done: (e) ->
    e.preventDefault()
    @hide()
    data = Backbone.Syphon.serialize @
    data.attendee_ids = [''] if data.attendee_ids == null
    data.date = Date.parse(data.date).toString('yyyy-MM-dd')
    console.log data.date
    @model.save data,
      success : (workshop) =>
        Backbone.trigger 'workshop:show', @model

