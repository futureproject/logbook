dream.Views.People ||= {}

class dream.Views.People.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:show', @display
    @listenTo Backbone, 'person:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'person:edit', @model
    'blur #person_notes': 'saveNotes'
    'submit #new_one_on_one': 'logOneOnOne'

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/people/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    @updateCounts()
    @showLogs()
    return @

  updateCounts: ->
    Backbone.trigger 'projects:findByLeaderId', @model.get('id'), (projects) =>
      $('#primary_projects_count').text(projects.length)
    Backbone.trigger 'projects:findByParticipantId', @model.get('id'), (projects) =>
      $('#secondary_projects_count').text(projects.length)
    Backbone.trigger 'workshops:findByAttendeeId', @model.get('id'), (workshops) =>
      $('#workshops_attended_count').text(workshops.length)

  showLogs: ->
    Backbone.trigger 'one_on_ones:findByPersonId', @model.get('id'), (one_on_ones) =>
      totalTime = 0
      list = $('.one_on_ones')
      _.each one_on_ones, (log) =>
        totalTime += parseFloat(log.get('duration'))
        list.append(
          new dream.Views.OneOnOnes.OneOnOneView(model: log).render().el
        )
      $('#hours_coached').text(totalTime)

  hide: ->
    @$el.hide()

  saveNotes: (e) ->
    @model.save
      notes: $(e.currentTarget).val()

  logOneOnOne: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize e.currentTarget
    data.person_id = @model.get('id')
    data.school_id = dream.USER.school.id
    data.date = Date.parse(data.date).toString('yyyy-MM-dd')
    o = new dream.Models.OneOnOne(data)
    Backbone.trigger 'one_on_ones:add', o
    @render()

